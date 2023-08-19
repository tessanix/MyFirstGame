CXX := g++
CXXFLAGS := -Wall -fPIC -shared
OUTPUT := mylib

LIB_DIRS := -L../GodotBindings/lib
LIB_NAMES := -lgodot-cpp.windows.template_debug.x86_64

INCLUDE := \
		-I../GodotBindings/include/ \
		-I../GodotBindings/include/godot_cpp \
		-I../godot-cpp-master/gdextension \
		-I../GodotBindings/godot-headers-3.x \
		-I../godot-cpp-master/gen/include \
		-I../godot-cpp-master/gen/include/godot_cpp/classes \
		-Isrc

# SOURCES_LIBS = \
# 		src/vendor/stb_image/stb_image.cpp \
# 		$(wildcard src/vendor/imgui/*.cpp)

SOURCES := \
	../GodotBindings/lib/libgodot-cpp.windows.template_debug.x86_64.a \
	$(wildcard src/*.cpp)
		

all: $(OUTPUT)

# Build the dynamic library
$(OUTPUT):
	$(CXX) $(CXXFLAGS) $(INCLUDE) -o $@ $(SOURCES) $(LIB_DIRS) $(LIB_NAMES)

# clean:
# 	@rm -rf $(OUTPUT)