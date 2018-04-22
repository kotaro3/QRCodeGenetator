# QRCode Generator
どこにでもあるQRコード生成ライブラリだよ！

## Installation
Carthageだけ対応。(CocoaPods対応は未定)

`github "kotaro3/QRCodeGenetator"`

## How to use
1. ViewにQRCodeImageViewを設定する。(ModuleにはQRCodeGeneratorを設定する。)

2. 好きなタイミングで生成する  
	`qrCodeImageView.generate(withData: "TEST", encoding: .utf8, correctionLevel: .L)`  
	withData: コードに変換する文字列  
 	encoding: 変換する文字列のエンコード指定  
 	correctionLevel: 誤り訂正レベル (L: 7%, M: 15%, Q: 25%, H: 30%)
