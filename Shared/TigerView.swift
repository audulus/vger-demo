//  Copyright © 2021 Audulus LLC. All rights reserved.

import SwiftUI
import vger
import vgerSwift

struct TigerView: View {

    var model: TigerModel

    var body: some View {
        GeometryReader { geom in
            VgerView(renderCallback: { vger in model.draw(vger: vger, size: geom.size)})
                .gesture(MagnificationGesture().onChanged({ scale in
                    model.scale = scale
                }))
        }

    }
}

struct TigerView_Previews: PreviewProvider {
    static var previews: some View {
        TigerView(model: TigerModel())
    }
}
