//  Copyright © 2021 Audulus LLC. All rights reserved.

import SwiftUI
import vger
import vgerSwift

func rand2() -> SIMD2<Float> {
    return SIMD2<Float>(Float(arc4random()) / Float(RAND_MAX), Float(arc4random()) / Float(RAND_MAX));
}

struct TileTestView: View {

    func draw(vger: vgerContext) {

        /*
        var seg = vgerPrim()
        seg.type = vgerSegment
        seg.width = 1.0
        seg.cvs.0 = .init(128, 128)
        seg.cvs.1 = .init(384, 384)
        seg.paint = vgerColorPaint(.init(0, 1, 1, 1))

        vgerRender(vger, &seg)
*/

        let n = 15
        var cvs = [SIMD2<Float>](repeating: SIMD2<Float>.zero, count: n)
        for i in 0..<n-1 {
            cvs[i] = rand2()
        }
        cvs[n-1] = cvs[0]

        


    }

    var model: TigerModel

    var body: some View {
        GeometryReader { geom in
            VgerTileView(renderCallback: { vger in model.draw(vger: vger, size: geom.size)})
                .gesture(MagnificationGesture().onChanged({ scale in
                    model.scale = scale
                }))
        }

    }
}

struct TileTestView_Previews: PreviewProvider {
    static var previews: some View {
        TileTestView(model: TigerModel())
    }
}
