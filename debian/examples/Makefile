JAVA_SRC_FILES	=	MagickWindow.java Test.java Loop.java
CLEAN_LIST	=	copy.jpg blank.jpg copy_pics.jpg rotated.jpg \
			sheared.jpg quantized.png scaled.jpg cropped.jpg \
			chopped.jpg sharpened.jpg despeckled.jpg \
			convolved.jpg blob.jpg montage.jpg average.jpg \
			blob.gif transparent.png border.jpg raised.jpg \
			clone.jpg

# For Solaris and Linux, LD_LIBRARY_PATH sets the shared library path
# For Mac OS X, DYLD_LIBRARY_PATH sets the shared library path
JAVA=/usr/lib/jvm/java-gcj/bin/java
JAVAC=/usr/lib/jvm/java-gcj/bin/javac

build:
	$(JAVAC) -cp ..:/usr/share/java/jmagick6.jar *.java

test: build
	LD_LIBRARY_PATH=/usr/lib/jni/ DYLD_LIBRARY_PATH=/usr/lib/jni $(JAVA) -cp ..:/usr/share/java/jmagick6.jar test.Test

test2: build
	LD_LIBRARY_PATH=/usr/lib/jni/ DYLD_LIBRARY_PATH=/usr/lib/jni $(JAVA) -cp ..:/usr/share/java/jmagick6.jar test.Loop pics.jpg
