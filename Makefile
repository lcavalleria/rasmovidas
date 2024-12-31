include config.mk

deploy:
	@echo "Create tmp directory"
	@ssh $(user)@$(ip) 'rm -rf /tmp/rasmovidas/'
	@ssh $(user)@$(ip) 'mkdir /tmp/rasmovidas/'
	@echo "Copy setup to tmp"
	@scp -r src/ $(user)@$(ip):/tmp/rasmovidas
	@echo "Run steps"
	@ssh $(user)@$(ip) ' \
		echo "Install docker"; \
		/tmp/rasmovidas/src/docker/setup.sh; \
		echo "Start containers"; \
		docker compose -f /tmp/rasmovidas/src/docker/containers/docker-compose.yml up -d; \
		echo "Cleanup tmp dir"; \
		rm -rf /tmp/rasmovidas; \
	'
