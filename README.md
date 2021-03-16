# Oklab

Swift implementation of Björn Ottosson's Oklab perceptual color space for image processing.

Learn more:

- [From Björn](https://bottosson.github.io/posts/oklab/)
- [Review by Raph Levien](https://raphlinus.github.io/color/2021/01/18/oklab-critique.html)
<br><br>

![Color space Munsell comparisons](https://i.imgur.com/6oUoU1Q.png "Comparisons")
<br><br>

## How to use

Inits move any `NSColor` `UIColor` `Color` `CIColor` or `CGColor` to the Oklab color space. Conversion uses `simd`. 

```swift
import Oklab

let original = NSColor.black
let ok = OklabColor(ns: original)
let stillBlack = NSColor(ok)
```

When manipulating a cartesian color doesn't suit you, get a polar Oklab color — or just the chroma and hue components — as below.

```swift
let cartesian = OklabColor(lightness: 0, a: 0, b: 0, alpha: 1)
let polar = OklabColorPolar(cartesian)
let polar = cartesian.getPolarOklabColor()

let hueAngle = cartesian.getHueAngleDegrees()
let hueAngle = cartesian.getHueAngleRadians()
let chroma = cartesian.getChroma()
```

The `OklabColor` and `OklabPolarColor` structs are defined as below. `Channel` is a typealias for `Float`. For an idea about the ranges for the `a` and `b` channels, see Björn's Munsell plot preserved above or [on his GitHub.](https://bottosson.github.io/img/oklab/oklab_munsell.png)

```swift
public struct OklabColor {

    /// Perceived lightness
    public var L: Channel
    
    /// Green/red
    public var a: Channel
    
    /// Yellow/blue
    public var b: Channel
    
    /// Alpha 0...1
    public var alpha: Channel
    
    /// Vector construct of Lab channels
    public var vector: SIMD3<Channel> {
        SIMD3<Channel>(L, a, b)
    }
}

```
```swift
public struct OklabColorPolar {
    
    /// Perceived lightness
    public var L: Channel
    
    ///  Chroma
    public var C: Channel
    
    /// Hue angle in radians
    public var h: Channel
    
    /// Alpha 0...1
    public var alpha: Channel
    
    public var hueDegrees: Channel {
        abs((h * 180 / .pi) - 360)
    }
}
```

That's all folks.
<br><br>

## License ("MIT")

Swift implementation is Copyright (c) 2021 Ryan Ferrell under the license below.

Oklab is Copyright (c) 2020 Björn Ottosson. 

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
