//
//  ContentView.swift
//  GeometryDemo
//
//  Created by HIROKI IKEUCHI on 2026/07/31.
//

import SwiftUI

// MARK: - Utils

extension View {
    @ViewBuilder
    func `if`<Content: View>(
        _ condition: Bool,
        @ViewBuilder transform: (Self) -> Content
    ) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
    @ViewBuilder
    func `if`<TrueContent: View, FalseContent: View>(
        _ condition: Bool,
        @ViewBuilder _ then: (Self) -> TrueContent,
        @ViewBuilder `else`: (Self) -> FalseContent
    ) -> some View {
        if condition {
            then(self)
        } else {
            `else`(self)
        }
    }
}

// MARK: - geometryGroup

struct GeometryGroupView: View {
    @State private var isDelivered = false
    
    var body: some View {
        VStack {
            DeliveryStatusLabel(isDelivered: isDelivered)
            /*
             アニメーション中に子要素が変化する場合に役立つ
             */
                .geometryGroup()
                .frame(
                    maxWidth: .infinity,
                    alignment: isDelivered ? .trailing : .leading
                )
            
            Button("Update status") {
                withAnimation(.easeInOut(duration: 0.5)) {
                    isDelivered.toggle()
                }
            }
        }
        .padding()
    }
}

struct DeliveryStatusLabel: View {
    let isDelivered: Bool
    
    private var color: Color {
        isDelivered ? .green : .blue
    }
    
    var body: some View {
        Text(isDelivered ? "Delivered" : "Out for delivery")
            .foregroundStyle(color)
            .padding()
            .background(color.opacity(0.15), in: .capsule)
    }
}

// MARK: - compositingGroup

struct CompositingGroupView: View {
    @State private var isPaused = true
    @State private var compositingGroup = true
    
    var body: some View {
        VStack {
            HStack(spacing: -16) {
                Avatar(initials: "LM", color: .indigo)
                Avatar(initials: "AK", color: .pink)
                Avatar(initials: "SR", color: .teal)
            }
            .if(compositingGroup) {
                // 階層構造を単一のグラフィック結果として扱う場合
                $0.compositingGroup()
            }
            .opacity(isPaused ? 0.3 : 1)

            VStack {
                Toggle("isPaused", isOn: $isPaused)
                Toggle("compositingGroup", isOn: $compositingGroup)
            }.frame(width: 200)
        }
    }
}

private struct Avatar: View {
    let initials: String
    let color: Color
    
    var body: some View {
        Text(initials)
            .font(.title.bold())
            .foregroundStyle(.white)
            .padding()
            .background(color, in: .circle)
    }
}

// MARK: - drawingGroup

struct PhotoPreview: View {
    
    @State private var drawingGroup = true
    
    var body: some View {
        VStack {
            Color.clear
                .overlay {
                    Image(systemName: "doc.fill")
                        .resizable()
                        .scaledToFill()
                        .foregroundStyle(.blue)
                        .blur(radius: 16)
                }
                .overlay {
                    Image(systemName: "doc.fill")
                        .resizable()
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius: 8))
                        .foregroundStyle(.black)
                        .padding()
                }
                .aspectRatio(1, contentMode: .fit)
                .clipShape(.rect(cornerRadius: 20))
                .if(drawingGroup) {
                    /*
                     このメソッドは
                     Viewの中の全てのViewを
                     画面上には見えないオフスクリーン上で
                     Metal APIを使用して
                     一つのイメージにまとめて描画し
                     最終的な内容を画面に出力するようにしてくれます。

                     こうすることでメモリへの負荷を軽減させて
                     パフォーマンスを向上させることができます。
                     
                     ただし見た目は変わらない
                     */
                    $0.drawingGroup()
                }
            
            VStack {
                Toggle("drawingGroup", isOn: $drawingGroup)
            }
            .frame(width: 200)
        }
    }
}

// MARK: - Preview

#Preview {
    GeometryGroupView()
}

#Preview {
    CompositingGroupView()
}


#Preview("drawingGroup") {
    PhotoPreview()
}
