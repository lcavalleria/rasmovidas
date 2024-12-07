include config.mk

deploy:
	scp src/setup.sh $(user)@$(ip):$(dir)
