#import "@preview/fontawesome:0.5.0": *

#let filename = sys.inputs.at("filename", default: "./resume.yaml")
#let info = yaml(filename)

#let vertical_margins = 15pt
#let horizontal_margin = 15pt
#let header_height = 80pt

#let font_size = 0.9em

#let primary_color = rgb(info.colors.primary)
#let secondary_color = rgb(info.colors.secondary)
#let background_color = rgb(info.colors.background)

#set page(
  margin: (
    left: 0mm,
    right: 0mm,
    top: vertical_margins,
    bottom: vertical_margins,
  ),
  background: context {
    if counter(page).get().first() > 1 {
      place(
        top + left,
        dy: vertical_margins,
        rect(
          stroke: (right: stroke(thickness: 0.5pt)),
          width: 33.33333%,
          height: 100% - 45pt,
          outset: (bottom: 15pt),
        ),
      )
    } else {
      place(
        top + left,
        dy: vertical_margins + header_height + 12pt,
        rect(
          stroke: (right: stroke(thickness: 0.5pt)),
          width: 33.33333%,
          height: 100% - 135pt,
          outset: (bottom: 15pt),
        ),
      )
    }

  },
)

#set text(font: "Lato", secondary_color, size: font_size)

#let sectionHeader(headerText: "") = {
  block(
    text(
      upper(headerText),
      primary_color,
      size: 1.3em,
      weight: "extrabold",
      tracking: 0.1em,
    ),
  )
}

#let contactSection(contacts) = {
  contacts
    .map(c => {
        let t = text(c.text)

        if c.at("link", default: none) != none {
          t = link(c.link, t)
        }

        if c.at("icon", default: none) != none {
          t = text(text(
            fa-icon(c.icon, solid: true),
            baseline: 1pt,
          ) + "   " + t)
        }
        t
      })
    .join("\n")
}

#let createLeftRight(
  left: none,
  right: none,
  weight: "regular",
) = {
  if (right == none) {
    align(start, text(left, size: 1.1em, weight: weight))
  } else {
    grid(
      columns: (1fr, 1fr),
      align(start, text(left, size: 1.1em, weight: weight)),
      align(end, text(right, size: 1.1em, weight: weight)),
    )
  }
}

#let parseSubSections(subSections) = {
  subSections
    .enumerate()
    .map(((index, s)) => {
        let title = s.at("title", default: none)
        let title_end = s.at("title_end", default: none)
        let subtitle = s.at("subtitle", default: none)
        let subtitle_end = s.at("subtitle_end", default: none)
        let description = s.at("description", default: "")

        pad(
          top: if index != 0 {
            10pt
          } else {
            0pt
          },
          [
            #createLeftRight(
              left: title,
              right: title_end,
              weight: "bold",
            )
            #if subtitle != none or subtitle_end != none [
              #text(
                createLeftRight(
                  left: subtitle,
                  right: subtitle_end,
                ),
              )
            ]
            #if description != "" {
              eval(description, mode: "markup")
            }
            #list(
              ..s.at("content", default: ()).map(c => eval(c, mode: "markup")),
            )
          ],
        )
      })
    .join()
}

#let parseSection(
  section,
  breakable: true,
) = {
  section
    .map(m => {
        block(
          breakable: breakable,
          [
            #sectionHeader(headerText: m.title)
            #parseSubSections(m.content)
          ],
        )
      })
    .join()
}

#let header(
  title: "",
  subTitle: "",
) = {

  let formattedTitle = block(
    upper(
      text(
        2.3em,
        weight: "bold",
        primary_color,
        title,
        tracking: 0.05em,
        font: "Glacial Indifference",
      ),
    ),
  )
  let formattedSubtitle = block(
    upper(
      text(1.5em, weight: "bold", tracking: 0.05em, secondary_color, subTitle),
    ),
  )

  let titleColumn = align(center)[
    #formattedTitle
    #formattedSubtitle
  ]

  box(
    width: 1fr,
    fill: background_color,
    inset: header_height / 4,
    height: header_height,
    titleColumn,
  )
}

#let leftColumn(
  contacts,
  sidebar,
) = {
  let header = sectionHeader(headerText: "Contact")
  block(
    header + contactSection(contacts) + parseSection(
      sidebar,
      breakable: false,
    ),
    inset: (
      left: horizontal_margin,
      right: horizontal_margin,
      top: 0em,
      bottom: vertical_margins,
    ),
  )
}

#let rightColumn(
  main,
) = {
  block(
    parseSection(main),
    inset: (
      left: horizontal_margin,
      right: horizontal_margin,
      top: 0em,
      bottom: vertical_margins,
    ),
  )
}

#let project(
  name: "",
  email: none,
  title: none,
  contacts: (),
  skills: (
    languages: (),
  ),
  main: ((title: "", content: [])),
  sidebar: (),
  body,
) = {
  header(
    title: name,
    subTitle: title,
  )
  grid(
    columns: (1fr, 2fr),
    align(
      start,
      leftColumn(
        contacts,
        sidebar,
      ),
    ),
    align(
      start,
      rightColumn(main),
    ),
  )
}

#show: project.with(
  name: info.name,
  title: info.title,
  contacts: info.contact,
  main: info.main,
  sidebar: info.sidebar,
)
