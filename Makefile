.PHONY: help

help:
	@echo 'Usage: make <OPTIONS> ... <TARGETS>'
	@echo ''
	@echo 'Available targets are:'
	@echo ''
	@echo '    help               Show this help screen.'
	@echo '    server             Run development server.'
	@echo ''

.DEFAULT_GOAL := help

server:
	hugo server -t terminal
