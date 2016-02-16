build:
	@echo "Building Environment"
	@swift build

test: build
	@echo "Testing Environment"
	.build/debug/EnvironmentTests

clean:
	rm -rf .build Packages
	
