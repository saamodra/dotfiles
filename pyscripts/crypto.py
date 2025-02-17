import yfinance as yf
import argparse

def get_realtime_btc_idr():
    try:
        # Get real-time BTC price in USD
        btc_usd_price = yf.Ticker("BTC-USD").fast_info["last_price"]

        # Get real-time USD to IDR exchange rate
        usd_to_idr = yf.Ticker("USDIDR=X").fast_info["last_price"]

        # Convert BTC price to IDR
        btc_idr_price = btc_usd_price * usd_to_idr

        # 
        return f'%{{F#F79413}}%{{F-}}{int(btc_idr_price):,}'
        # # Format output
        # if use_color:
        # else:
        #     return f' BTC {int(btc_idr_price):,} IDR'

    except Exception as e:
        return f"Error fetching BTC price: {str(e)}"

# Argument parsing
parser = argparse.ArgumentParser(description="Get real-time Crypto price in IDR.")
args = parser.parse_args()

# Get and display real-time BTC price in IDR
print(get_realtime_btc_idr())
