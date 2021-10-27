//
//  TextAddView.swift
//  MeMyself
//
//  Created by Jannis Grimm on 10/24/21.
//

import SwiftUI

struct TextAddView: View {
    
    @State var noteText = ""
    
    var body: some View {
        
        //Holds the textfield
        VStack {
            
            MultilineTextField("Add anything...", text: self.$noteText)
        }
        .padding()
        .background(Color("StructCellBG"))
        .cornerRadius(15)
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            
    }
}

struct TextAddView_Previews: PreviewProvider {
    static var previews: some View {
        TextAddView()
    }
}

struct MultilineTextField: View {

    private var placeholder: String
    private var onCommit: (() -> Void)?

    @Binding private var text: String
    private var internalText: Binding<String> {
        Binding<String>(get: { self.text } ) {
            self.text = $0
            self.showingPlaceholder = $0.isEmpty
            
        }
    }

    @State private var dynamicHeight: CGFloat = 100
    @State private var showingPlaceholder = false

    init (_ placeholder: String = "", text: Binding<String>, onCommit: (() -> Void)? = nil) {
        self.placeholder = placeholder
        self.onCommit = onCommit
        self._text = text
        self._showingPlaceholder = State<Bool>(initialValue: self.text.isEmpty)
    }

    var body: some View {
        UITextViewWrapper(text: self.internalText, calculatedHeight: $dynamicHeight, onDone: onCommit)
            .frame(minHeight: dynamicHeight, maxHeight: dynamicHeight)
            .overlay(placeholderView, alignment: .topLeading)
        .lineSpacing(40)

        
    }

    var placeholderView: some View {
        Group {
            if showingPlaceholder {
                Text(placeholder).foregroundColor(Color.gray)
                    .padding(.leading, 4)
                    .padding(.top, 8)
                .lineSpacing(40)
                
            }
        }
    }
}

fileprivate struct UITextViewWrapper: UIViewRepresentable {
    typealias UIViewType = UITextView

    @Binding var text: String
    @Binding var calculatedHeight: CGFloat
    var onDone: (() -> Void)?

    func makeUIView(context: UIViewRepresentableContext<UITextViewWrapper>) -> UITextView {
        let textField = UITextView()
        textField.delegate = context.coordinator

        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 10
        let atributes = [NSAttributedString.Key.paragraphStyle: style]
        textField.attributedText = NSAttributedString(string: "hello", attributes: atributes)
        

        textField.isEditable = true
        textField.backgroundColor = UIColor.clear
        textField.isSelectable = true
        let theFont = UIFont.systemFont(ofSize: 16, weight: .medium)
        textField.font = theFont
        textField.isUserInteractionEnabled = true
        textField.isScrollEnabled = false
        textField.textColor = UIColor.init(named: "B&W")
        textField.backgroundColor = UIColor.clear
        textField.becomeFirstResponder()
        
        
        if nil != onDone {
            textField.returnKeyType = .done
        }

        textField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return textField
    }

    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<UITextViewWrapper>) {
        if uiView.text != self.text {
            uiView.text = self.text
        }
        UITextViewWrapper.recalculateHeight(view: uiView, result: $calculatedHeight)
    }

    fileprivate static func recalculateHeight(view: UIView, result: Binding<CGFloat>) {
        let newSize = view.sizeThatFits(CGSize(width: view.frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        if result.wrappedValue != newSize.height {
            DispatchQueue.main.async {
                result.wrappedValue = newSize.height // !! must be called asynchronously
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text, height: $calculatedHeight, onDone: onDone)
    }

    final class Coordinator: NSObject, UITextViewDelegate {
        var text: Binding<String>
        var calculatedHeight: Binding<CGFloat>
        var onDone: (() -> Void)?

        init(text: Binding<String>, height: Binding<CGFloat>, onDone: (() -> Void)? = nil) {
            self.text = text
            self.calculatedHeight = height
            self.onDone = onDone
        }

        func textViewDidChange(_ uiView: UITextView) {
            text.wrappedValue = uiView.text
            UITextViewWrapper.recalculateHeight(view: uiView, result: calculatedHeight)
        }

        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            if let onDone = self.onDone, text == "\n" {
                textView.resignFirstResponder()
                onDone()
                return false
            }
            return true
        }
    }
    
    

}
