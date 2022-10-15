# https://medium.com/scb-digital/running-a-private-ethereum-blockchain-using-docker-589c8e6a4fe8

start: 
	docker compose up

check_connect:
	@curl --location --request POST 'localhost:8545' \
		--header 'Content-Type: application/json' \
		--data-raw "{\"jsonrpc\": \"2.0\", \"id\": 1, \"method\": \"admin_peers\", \"params\": []}"

get_latest_block:	
	@curl --location --request POST 'localhost:8545' \
		--header 'Content-Type: application/json' \
		--data-raw "{\"jsonrpc\": \"2.0\", \"id\": 2, \"method\": \"eth_blockNumber\", \"params\": []}"

get_addresses:
	@curl --location --request POST 'localhost:8545' \
		--header 'Content-Type: application/json' \
		--data-raw "{\"jsonrpc\": \"2.0\", \"id\": 3, \"method\": \"eth_accounts\", \"params\": []}"

get_balance: 
	@curl --location --request POST 'localhost:8545' \
		--header 'Content-Type: application/json' \
		--data-raw "{\"jsonrpc\": \"2.0\", \"id\": 4, \"method\": \"eth_getBalance\", \"params\": [\"${address}\", \"latest\"]}"

get_primary_balance:
	@$(MAKE) get_primary_address | grep -o '0x[0-9a-z]*' | xargs -I{} $(MAKE) get_balance address={}

# password defaults to \enter 
create_account: 
	@curl --location --request POST 'localhost:8545' \
			--header 'Content-Type: application/json' \
			--data-raw "{\"jsonrpc\": \"2.0\", \"id\": 5, \"method\": \"personal_newAccount\", \"params\": [\"\"]}"

unlock_account: 
	@curl --location --request POST 'localhost:8545' \
		--header 'Content-Type: application/json' \
		--data-raw "{\"jsonrpc\": \"2.0\", \"id\": 6, \"method\": \"personal_unlockAccount\", \"params\": [\"${address}\", \"\"]}"

send: 
	@curl --location --request POST 'localhost:8545' \
		--header 'Content-Type: application/json' \
		--data-raw "{\"jsonrpc\": \"2.0\", \"id\": 7, \"method\": \"eth_sendTransaction\", \"params\": [{\"from\": \"${from}\", \"to\": \"${to}\", \"value\": \"${value}\"}]}"

get_transaction: 
	@curl --location --request POST 'localhost:8545' \
		--header 'Content-Type: application/json' \
		--data-raw "{\"jsonrpc\": \"2.0\", \"id\": 8, \"method\": \"eth_getTransactionByHash\", \"params\": [\"${hash}\"]}"
