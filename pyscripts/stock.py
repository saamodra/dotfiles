import yfinance as yf
import argparse
import random

def process_tickers(ticker_names, use_color=True):
    try:
        tickers_yahoo = yf.Tickers(' '.join(ticker_names))
        results = []
        for ticker_name in ticker_names:
            data = tickers_yahoo.tickers[ticker_name].history(period='5d')
            last_two_closes = data['Close'].tail(2)
            today_close = last_two_closes.iloc[1]
            yesterday_close = last_two_closes.iloc[0]
            difference = today_close - yesterday_close

            if difference > 0:
                if use_color:
                    results.append(f'%{{F#61C766}}%{{F-}} {int(today_close):,} %{{F#61C766}}(+{int(difference)})%{{F-}}')
                else:
                    results.append(f' {ticker_name} {int(today_close):,} (+{int(difference)})')
            else:
                if use_color:
                    results.append(f'%{{F#f24141}}%{{F-}} {int(today_close):,} %{{F#F24141}}({int(difference)})%{{F-}}')
                else:
                    results.append(f' {ticker_name} {int(today_close):,} ({int(difference)})')
        return results
    except Exception as e:
        return [f'Error processing {ticker_names}: {str(e)}']

parser = argparse.ArgumentParser(description='Process stock tickers.')
parser.add_argument('--state_file', type=str, default='', help='File to store the last processed ticker')
parser.add_argument('--mode', type=str, choices=['all', 'random'], default='random', help='Mode to output tickers: all or random')
parser.add_argument('--no_color', action='store_true', help='Show output without color')

args = parser.parse_args()

state_file = args.state_file if args.state_file else 'last_ticker.txt'
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