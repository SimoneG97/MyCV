#import "template.typ": *

#set page(
  margin: (
    left: 0mm,
    right: 0mm,
    top: 15pt,
    bottom: 15pt,
  ),
  background: context {
    if counter(page).get().first() > 1 {
      place(
        top + left,
        dy: 15pt,
        rect(
          stroke: (right: stroke(thickness: 0.5pt)),
          width: 33.33333%,
          height: 100% - 50pt,
          outset: (bottom: 20pt),
        ),
      )
    } else {
      place(
        top + left,
        dy: 15pt + 80pt + 13pt,
        rect(
          stroke: (right: stroke(thickness: 0.5pt)),
          width: 33.33333%,
          height: 100% - 140pt,
          outset: (bottom: 20pt),
        ),
      )
    }

  },
)


#let info = yaml("./resume.yaml")

#set text(font: "Lato", rgb(info.colors.secondary), size: 0.9em)

#show: project.with(
  headerBackground: rgb(info.colors.background),
  primaryColor: rgb(info.colors.primary),
  secondaryColor: rgb(info.colors.secondary),
  name: info.name,
  title: info.title,
  contacts: info.contact,
  main: info.main,
  sidebar: info.sidebar,
)

