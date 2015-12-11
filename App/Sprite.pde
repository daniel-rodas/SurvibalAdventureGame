class Sprite {

  State state;
//  SpritePath path;
  float halign=0, valign=0;
  float halfwidth, halfheight;

  // Sprites have a specific coordinate that acts as "anchor" when multiple
  // sprites are used for a single actor. When swapping sprite A for sprite
  // B, the two coordinates A(h/vanchor) and B(h/vanchor) line up to the
  // same screen pixel.
  float hanchor=0, vanchor=0;

  // frame data
  PImage[] frames;          // sprite frames
  int numFrames=0;          // frames.length cache
  float frameFactor=1;      // determines that frame serving compression/dilation

  boolean hflip = false;   // draw horizontall flipped?
  boolean vflip = false;   // draw vertically flipped?


  // animation properties
  boolean visible = true;  // should the sprite be rendered when draw() is called?
  boolean animated = true; // is this sprite "alive"?
  int frameOffset = 0;      // this determines which frame the sprite synchronises on
  int framesServed = 0;

  /**
   * Shortcut constructor, if the sprite has one frame
   */
//  Sprite(String spritefile) {
//    this(spritefile, 1, 1, 0, 0);
//  }

  /**
   * Shortcut constructor, to build a Sprite directly off of a sprite map image.
   */
//  Sprite(String spritefile, int rows, int columns) {
//    this(spritefile, rows, columns, 0, 0);
//  }

  /**
   * Shortcut constructor, to build a Sprite directly off of a sprite map image.
   */
/*  Sprite(String spritefile, int rows, int columns, float xpos, float ypos) {
    this(SpriteMapHandler.cutTiledSpritesheet(spritefile, columns, rows, true), xpos, ypos, true);
  }
*/
  /**
   * Full constructor.
   */
//  private Sprite(PImage[] _frames, float _xpos, float _ypos, boolean _visible) {
//    path = new SpritePath();
//    setFrames(_frames);
//    visible = _visible;
//  }

  /**
   * Flip all frames for this sprite horizontally.
   */
  void flipHorizontal() {
    hflip = !hflip;
    for (PImage img : frames) {
      img.loadPixels();
      int[] pxl = new int[img.pixels.length];
      int w = int(width), h = int(height);
      for (int x=0; x<w; x++) {
        for (int y=0; y<h; y++) {
          pxl[x + y*w] = img.pixels[((w-1)-x) + y*w];
        }
      }
      img.pixels = pxl;
      img.updatePixels();
    }
  }


  /**
   * Flip all frames for this sprite vertically.
   */
  void flipVertical() {
    vflip = !vflip;
    for (PImage img : frames) {
      img.loadPixels();
      int[] pxl = new int[img.pixels.length];
      int w = int(width), h = int(height);
      for (int x=0; x<w; x++) {
        for (int y=0; y<h; y++) {
          pxl[x + y*w] = img.pixels[x + ((h-1)-y)*w];
        }
      }
      img.pixels = pxl;
      img.updatePixels();
    }
  }

}

