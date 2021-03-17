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

let black      = NSColor.black

let oklab      = OklabColor(ns: black)
let stillBlack = NSColor(oklab)

let polar      = OklabColorPolar(ns: black)
let stillBlack = NSColor(polar)
```

Manipulating hue and chroma is easy with a polar Oklab color. The idea behind Oklab is that shifts in hue do not change perceived brightness or chroma. Hue is stored in radians, but you can translate that to degrees with `hueDegrees`, mutate the hue in degrees with `setHueTo(_:)`  or `setHueRotatedBy(_:)`, and instantiate a new color with `withHue(_:)`  or `withHueRotatedBy(_:)`. 

```swift
let pink = OklabColorPolar(lightness: 0.5, chroma: 0.24, hueDegrees: 0)
let blue = pink.withHueRotatedBy(degrees: 240)

let cartesian = OklabColor(lightness: 0.5, a: 0.2, b: 0.1, alpha: 1)
var polar     = OklabColorPolar(cartesian)
polar.setHueTo(degrees: 120)
polar.setHueRotatedBy(degrees: -90)

// Cartesian colors also report chroma and hue
let hueAngle = cartesian.getHueAngleDegrees()
let hueAngle = cartesian.getHueAngleRadians()
let chroma   = cartesian.getChroma()
```


The `OklabColor` and `OklabPolarColor` structs are defined as below. `Channel` is a typealias for `Float`. For an idea about the ranges for the `a` and `b` channels, see Björn's Munsell plot preserved above or [on his GitHub.](https://bottosson.github.io/img/oklab/oklab_munsell.png)

```swift
struct OklabColor {

    /// Perceptual lightness. To achieve pure black or white, also adjust chroma (polar) or a/b     channels (cartesian).
    var lightness: Channel
    
    /// Green to red. Range varies. Could span about -0.6...0.6 in medium brightness.
    var a: Channel
    
    /// Yellow to blue. Range varies. Could span about -0.55...0.8 in medium brightness.
    var b: Channel
    
    /// Opacity 0...1
    var alpha: Channel
    
    /// Vector construct of Lab channels for SIMD-based calculations
    var vector: SIMD3<Channel> {
        SIMD3<Channel>(lightness, a, b)
    }
}

```
```swift
struct OklabColorPolar {
    
    /// Perceived lightness
    var lightness: Channel
    
    ///  Chroma
    var chroma: Channel
    
    /// Originally set in 0...2π when converted from a cartesian color
    var hueRadians: Channel
    
    var hueDegrees: Channel {
        var degrees = hueRadians * 180 / .pi
        
        while degrees < 0   { degrees += 360 }
        while degrees > 360 { degrees -= 360 }
        return degrees
    }
    
    /// Alpha 0...1
    var alpha: Channel
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
