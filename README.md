# Kansas City Tax Auctions from 2011 to the Present

This repository contains data and scripts related to tax auctions and foreclosures in the Kansas City area from 2011 to the present. Legal Aid of Western Missouri and CodeForKC, working together, culled some of the early data from PDF records of the auctions. More recently, the data has become available in spreadsheet form. 

## Merging with Address Data to Allow Mapping of Auctions
The raw data contains parcel numbers but not addresses. By merging the data with address records from CodeForKC's AddressApi project, we were able to map tax auction locations.

## 2017 Tax Auctions and Foreclosures

Overlaying the tax auctions onto a map of Kansas City with census data on per capita income (at the block group level) shows the strong correlation between low income levels and tax delinquincies leading to the eventual loss of the property through foreclosure and auction.

![2017 KC Tax Auctions](https://github.com/buzwells/kc-tax-auctions/blob/master/img/KC-Tax-Auctions-2017.png)


