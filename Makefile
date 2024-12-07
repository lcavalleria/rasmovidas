include config.mk

deploy:
	@echo "Create tmp directory"
	@ssh $(user)@$(ip) 'mkdir /tmp/rasmovidas/'
	@echo "Copy setup to tmp"
	@scp -r src/ $(user)@$(ip):/tmp/rasmovidas
	@echo "Run steps"
	@ssh $(user)@$(ip) ' \
		echo "Install docker"; \
		/tmp/rasmovidas/src/docker/setup.sh; \
		echo "Start jellyfin container"; \
		docker compose -f /tmp/rasmovidas/src/jellyfin/docker-compose.yml up -d; \
		echo "Cleanup tmp dir"; \
		rm -rf /tmp/rasmovidas; \
	'
