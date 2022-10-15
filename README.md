# Getting started

Install Docker: https://docs.docker.com/get-docker/

To run:   
`docker compose up`. 

# Commands. 

Test connectivity: `make check_connect`. 

Get the latest block number: `make get_latest_block`. 

Get account addresses: `make get_addresses`. 

Get balance: `make get_balance address={address}`  

Get primary balance: `make get_primary_balance`. 

Create new account: `make create_account`. 

Unlock account: `make unlock_account address={address}`. 

Send: `make send from={from} to={to} value={value}`. 

Get transaction info: `make get_transaction hash={hash}`. 

https://medium.com/scb-digital/running-a-private-ethereum-blockchain-using-docker-589c8e6a4fe8
