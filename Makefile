CXXFLAGS = -O3 -g0 -march=native
LDFLAGS = $(CXXFLAGS)

# Define build directory
BUILD_DIR = build

# Ensure build directory exists
$(shell mkdir -p $(BUILD_DIR))

# Object files go into build/
OBJS = $(BUILD_DIR)/dns.o $(BUILD_DIR)/flokicoin.o $(BUILD_DIR)/netbase.o $(BUILD_DIR)/protocol.o $(BUILD_DIR)/db.o $(BUILD_DIR)/main.o $(BUILD_DIR)/util.o

# Target: Build dnsseed binary inside build/
$(BUILD_DIR)/dnsseed: $(OBJS)
	g++ -pthread $(LDFLAGS) -o $(BUILD_DIR)/dnsseed $(OBJS) -lcrypto

# Rule to compile .cpp files into .o files inside build/
$(BUILD_DIR)/%.o: %.cpp *.h
	g++ -std=c++11 -pthread $(CXXFLAGS) -Wall -Wno-unused -Wno-sign-compare -Wno-reorder -Wno-comment -c -o $@ $<

# Default target
all: $(BUILD_DIR)/dnsseed

# Clean build files
clean:
	rm -rf $(BUILD_DIR)