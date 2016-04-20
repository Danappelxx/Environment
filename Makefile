build:
	@echo "Building Environment"
	@swift build

test: build
	@echo "Testing Environment"
	@swift test

clean:
	@swift build --clean=dist
	
