from bs4 import BeautifulSoup
import requests
import pandas as pd

# BTC
url = "https://coinmarketcap.com/currencies/bitcoin/historical-data/?start=20130428&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./BTC.csv')

# ETH
url = "https://coinmarketcap.com/currencies/ethereum/historical-data/?start=20150807&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./ETH.csv')

# BCH
url = "https://coinmarketcap.com/currencies/bitcoin-cash/historical-data/?start=20170724&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./BCH.csv')

# XRP
url = "https://coinmarketcap.com/currencies/ripple/historical-data/?start=20130805&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./XRP.csv')

# LTC
url = "https://coinmarketcap.com/currencies/litecoin/historical-data/?start=20130429&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./LTC.csv')

# EOS
url = "https://coinmarketcap.com/currencies/eos/historical-data/?start=20170702&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./EOS.csv')

# BNB
url = "https://coinmarketcap.com/currencies/binance-coin/historical-data/?start=20170725&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./BNB.csv')

# USDT
url = "https://coinmarketcap.com/currencies/tether/historical-data/?start=20150306&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./USDT.csv')

# BSV
url = "https://coinmarketcap.com/currencies/bitcoin-sv/historical-data/?start=20181109&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./BSV.csv')

# DOGE
url = "https://coinmarketcap.com/currencies/dogecoin/historical-data/?start=20131215&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./DOGE.csv')

# XLM
url = "https://coinmarketcap.com/currencies/stellar/historical-data/?start=20140805&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./XLM.csv')

# IOTA
url = "https://coinmarketcap.com/currencies/iota/historical-data/?start=20170613&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./IOTA.csv')

# ETC
url = "https://coinmarketcap.com/currencies/ethereum-classic/historical-data/?start=20160724&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./ETC.csv')

# HT
url = "https://coinmarketcap.com/currencies/huobi-token/historical-data/?start=20180204&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./HT.csv')

# DASH
url = "https://coinmarketcap.com/currencies/dash/historical-data/?start=20140214&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./DASH.csv')

# TRX
url = "https://coinmarketcap.com/currencies/tron/historical-data/?start=20170913&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./TRX.csv')

# USDC
url = "https://coinmarketcap.com/currencies/usd-coin/historical-data/?start=20181009&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./USDC.csv')

# CKUSD
url = "https://coinmarketcap.com/currencies/ckusd/historical-data/?start=20180411&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./CKUSD.csv')

# USDS
url = "https://coinmarketcap.com/currencies/stableusd/historical-data/?start=20190206&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./USDS.csv')

# TUSD
url = "https://coinmarketcap.com/currencies/trueusd/historical-data/?start=20180306&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./TUSD.csv')

# GUSD
url = "https://coinmarketcap.com/currencies/gemini-dollar/historical-data/?start=20181006&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./GUSD.csv')

# PAX
url = "https://coinmarketcap.com/currencies/paxos-standard-token/historical-data/?start=20180928&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./PAX.csv')

# BTS
url = "https://coinmarketcap.com/currencies/bitshares/historical-data/?start=20140721&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./BTS.csv')

# BITUSD
url = "https://coinmarketcap.com/currencies/bitusd/historical-data/?start=20140923&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./BITUSD.csv')

# STEEM
url = "https://coinmarketcap.com/currencies/steem/historical-data/?start=20160419&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./STEEM.csv')

# SBD
url = "https://coinmarketcap.com/currencies/steem-dollars/historical-data/?start=20160719&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./SBD.csv')

# DAI
url = "https://coinmarketcap.com/currencies/dai/historical-data/?start=20171227&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./DAI.csv')

# USNBT
url = "https://coinmarketcap.com/currencies/nubits/historical-data/?start=20140924&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./USNBT.csv')

# ADA
url = "https://coinmarketcap.com/currencies/cardano/historical-data/?start=20171002&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./ADA.csv')

# NEO
url = "https://coinmarketcap.com/currencies/neo/historical-data/?start=20160909&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./NEO.csv')

# XEM
url = "https://coinmarketcap.com/currencies/nem/historical-data/?start=20150401&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./XEM.csv')

# REP
url = "https://coinmarketcap.com/currencies/augur/historical-data/?start=20151028&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./REP.csv')

# XMR
url = "https://coinmarketcap.com/currencies/monero/historical-data/?start=20140521&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./XMR.csv')

# UIP
url = "https://coinmarketcap.com/currencies/unlimitedip/historical-data/?start=20180124&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./UIP.csv')

# NANO
url = "https://coinmarketcap.com/currencies/nano/historical-data/?start=20170307&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./NANO.csv')

# BCD
url = "https://coinmarketcap.com/currencies/bitcoin-diamond/historical-data/?start=20171105&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./BCD.csv')

# BCG
url = "https://coinmarketcap.com/currencies/bitcoin-gold/historical-data/?start=20171024&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./BCG.csv')

# XIN
url = "https://coinmarketcap.com/currencies/mixin/historical-data/?start=20180109&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./XIN.csv')

# SBTC
url = "https://coinmarketcap.com/currencies/super-bitcoin/historical-data/?start=20171205&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./SBTC.csv')

# B2X
url = "https://coinmarketcap.com/currencies/segwit2x/historical-data/?start=20171021&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./B2X.csv')

# BCX
url = "https://coinmarketcap.com/currencies/bitcoinx/historical-data/?start=20171215&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./BCX.csv')

# BTX
url = "https://coinmarketcap.com/currencies/bitcore/historical-data/?start=20170428&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./BTX.csv')

# ONT
url = "https://coinmarketcap.com/currencies/ontology/historical-data/?start=20180308&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./ONT.csv')

# OKB
url = "https://coinmarketcap.com/currencies/ontology/historical-data/?start=20180308&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./ONT.csv')

# SUSD
url = "https://coinmarketcap.com/currencies/susd/historical-data/?start=20180714&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./SUSD.csv')

# MKR
url = "https://coinmarketcap.com/currencies/maker/historical-data/?start=20170103&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./MKR.csv')

# ATOM
url = "https://coinmarketcap.com/currencies/cosmos/historical-data/?start=20190315&end=20190525"
content = requests.get(url).content
soup = BeautifulSoup(content,'html.parser')
table = soup.find('table', {'class': 'table'})
data = [[td.text.strip() for td in tr.findChildren('td')] 
        for tr in table.findChildren('tr')]
df = pd.DataFrame(data)
df.drop(df.index[0], inplace=True)
df[0] =  pd.to_datetime(df[0])
for i in range(1,7):
    df[i] = pd.to_numeric(df[i].str.replace(",","").str.replace("-",""))
df.columns = ['Date','Open','High','Low','Close','Volume','Market Cap']
df.set_index('Date',inplace=True)
df.sort_index(inplace=True)
df.to_csv('./ATOM.csv')