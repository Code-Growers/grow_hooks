generate_doc:
	echo -e "Building doc"; \
	dart doc .;

init:
	echo -e "Initializing"; \
	dart pub get; \
	dart run index_generator;

