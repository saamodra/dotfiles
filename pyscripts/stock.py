import yfinance as yf
import argparse
import random
import json
import datetime
import os


def get_current_time():
    return datetime.datetime.now().time()


def is_market_closed():
    current_time = get_current_time()
    return current_time >= datetime.time(16, 0) or current_time < datetime.time(9, 0)


def save_stock_data(filename, data):
    with open(filename, 'w') as file:
        json.dump(data, file, indent=4)


def load_stock_data(filename):
    if os.path.exists(filename):
        with open(filename, 'r') as file:
            return json.load(file)
    return {}


def get_ticker_data(ticker_name, use_color, cache_file='stock_data.json'):
    try:
        stock_data = load_stock_data(cache_file)
        if is_market_closed() and ticker_name in stock_data:
            today_close = stock_data[ticker_name]['today_close']
            difference = stock_data[ticker_name]['difference']
        else:
            ticker = yf.Ticker(ticker_name)
            data = ticker.history(period='5d')
            last_two_closes = data['Close'].tail(2)
            today_close = last_two_closes.iloc[1]
            yesterday_close = last_two_closes.iloc[0]
            difference = today_close - yesterday_close

            stock_data[ticker_name] = {
                'today_close': today_close,
                'difference': difference
            }
            save_stock_data(cache_file, stock_data)

        if difference > 0:
            if use_color:
                return f'%{{F#61C766}}%{{F-}} {int(today_close):,} %{{F#61C766}}(+{int(difference)})%{{F-}}'
            else:
                return f' {ticker_name} {int(today_close):,} (+{int(difference)})'
        else:
            if use_color:
                return f'%{{F#f24141}}%{{F-}} {int(today_close):,} %{{F#F24141}}({int(difference)})%{{F-}}'
            else:
                return f' {ticker_name} {int(today_close):,} ({int(difference)})'
    except Exception as e:
        return f'Error processing {ticker_name}: {str(e)}'


def process_tickers(ticker_names, use_color=True):
    return [get_ticker_data(ticker_name, use_color) for ticker_name in ticker_names]


def main():
    parser = argparse.ArgumentParser(description='Process stock tickers.')
    parser.add_argument('--state_file', type=str, default='', help='File to store the last processed ticker')
    parser.add_argument('--mode', type=str, choices=['all', 'random'], default='random',
                        help='Mode to output tickers: all or random')
    parser.add_argument('--no_color', action='store_true', help='Show output without color')

    args = parser.parse_args()

    tickers = ['ADRO.JK', 'BBCA.JK', 'BBRI.JK']

    if args.mode == 'all':
        results = process_tickers(tickers, not args.no_color)
        for result in results:
            print(result)
    else:
        selected_ticker = random.choice(tickers)
        result = process_tickers([selected_ticker], not args.no_color)
        for res in result:
            print(res)


if __name__ == '__main__':
    main()
