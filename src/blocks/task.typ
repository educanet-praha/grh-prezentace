#import "./../globals.typ": *

#let task-slide(title, content) = {

  let self = s
  let self = utils.empty-page(self)
  let body = {
    content
  }
  (self.methods.touying-slide)(self: self, repeat: none, section: content, body)
}