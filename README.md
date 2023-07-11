# Задание 

На экране создать кнопку вызывающую модальное окно. окно должно быть двух размеров(среднего и большого) 
По центру модального окна вставить текст. С изменением размера окна текст меняется.

# Решение 

Инициализируем две переменные для управления модальным окном и для изменяющегося текста

```swift

@State var openSheet = false
@State var sheetText = "Medium Sheet View"

```
Создаем кнопку и назначаем действие вызова модального окна

```swift

VStack {
            Button("Open Sheet") {
                openSheet.toggle()
            }
            .buttonStyle(.bordered)
        }

```

Добавляем модификатор модального окна, добавляем в него **GeometryReader** для получения высоты. И добавляем в него текст.
Добавляем модификатор **onChange** для наблюдения за изменением высоты и в нем меняем текст согласно условию.

```swift

.sheet(isPresented: $openSheet) {
            GeometryReader { geo in
                Text(sheetText)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .onChange(of: geo.size) { newValue in
                        if geo.size.height > UIScreen.main.bounds.height / 2 {
                            sheetText = "Large Sheet View"
                        } else {
                            sheetText = "Medium Sheet View"
                        }
                    }
            }
        }
```
К **GeometryReader** добавляем модификатор размеров окна

```swift

.presentationDetents([.medium, .large])

```