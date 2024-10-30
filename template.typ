#import "@preview/fontawesome:0.5.0": *

#let contact(text: "", link: none, icon: "") = {
  (text: text, link: link, icon: icon)
}

#let secondaryTitle(content, secondaryColor: gray) = {
  text(weight: "bold", size: 1em, secondaryColor, content)
}

#let sectionHeader(headerText: "", primaryColor: black) = {
  block(
    text(
      upper(headerText),
      primaryColor,
      size: 1.3em,
      weight: "extrabold",
      tracking: 0.1em,
    ),
  )
}



#let contactSection(contacts, iconColor: black, secondaryColor: black) = {
  contacts
    .map(c => {
        let t = text(secondaryColor, c.text)

        if c.link != none {
          t = link(c.link, t)
        }

        if c.icon != "" {
          t = text(
            text(fa-icon(c.icon, solid: true), baseline: 1pt) + "   " + t,
            iconColor,
          )
        }
        t
      })
    .join("\n")
}

#let createLeftRight(left: [], right: none, secondaryColor: black) = {
  if (right == none) {
    align(start, text(left, secondaryColor))
  } else {
    grid(
      columns: (1fr, 1fr),
      align(start, text(left, secondaryColor)),
      align(end, text(right, secondaryColor)),
    )
  }
}

#let parseSubSections(subSections, secondaryColor: gray) = {
  subSections
    .map(s => {
        [
          #createLeftRight(
            left: secondaryTitle(s.title, secondaryColor: secondaryColor),
            right: if s.titleEnd != none {
              s.titleEnd
            },
            secondaryColor: secondaryColor,
          )
          #if s.subTitle != none or s.subTitleEnd != none [
            #text(
              top-edge: 0.2em,
              createLeftRight(
                left: s.subTitle,
                right: s.subTitleEnd,
                secondaryColor: secondaryColor,
              ),
            )
          ]
          #text(s.content, size: 0.9em, secondaryColor)
        ]
      })
    .join()
}

#let parseSection(
  section,
  primaryColor: black,
  secondaryColor: gray,
  breakable: true,
) = {
  section
    .map(m => {
        block(
          breakable: breakable,
          [
            #sectionHeader(headerText: m.title, primaryColor: primaryColor)
            #parseSubSections(m.content, secondaryColor: secondaryColor)
          ],
        )
      })
    .join()
}

#let subSection(
  title: "",
  titleEnd: none,
  subTitle: none,
  subTitleEnd: none,
  content: [],
) = {
  (
    title: title,
    titleEnd: titleEnd,
    subTitle: subTitle,
    subTitleEnd: subTitleEnd,
    content: content,
  )
}

#let section(title: "", content: subSection()) = {
  (title: title, content: content)
}

#let header(
  title: "",
  subTitle: "",
  backgroundColor: none,
  titleColor: black,
  subtitleColor: black,
) = {

  let formattedTitle = block(
    upper(
      text(
        2.3em,
        weight: "bold",
        titleColor,
        title,
        tracking: 0.05em,
        font: "Glacial Indifference",
      ),
    ),
  )
  let formattedSubtitle = block(
    upper(
      text(1.5em, weight: "bold", tracking: 0.05em, subtitleColor, subTitle),
    ),
  )

  let titleColumn = align(center)[
    #formattedTitle
    #formattedSubtitle
  ]

  box(
    width: 1fr,
    fill: backgroundColor,
    inset: 20pt,
    height: 80pt,
    titleColumn,
  )
}

#let leftColumn(
  contacts,
  sidebar,
  primaryColor: black,
  secondaryColor: gray,
) = {
  let header = sectionHeader(headerText: "Contact", primaryColor: primaryColor)
  block(
    header + contactSection(
      contacts,
      iconColor: primaryColor,
      secondaryColor: secondaryColor,
    ) + parseSection(
      sidebar,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      breakable: false,
    ),
    inset: (left: 1.3em, right: 1.3em, top: 0em, bottom: 15pt),
  )
}

#let rightColumn(
  main,
  primaryColor: black,
  secondaryColor: gray,
) = {
  block(
    parseSection(
      main,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
    ),
    inset: (left: 1.3em, right: 1.3em, top: 0em, bottom: 1.3em),
  )
}



#let project(
  primaryColor: rgb("#4273B0"),
  secondaryColor: black,
  headerBackground: white,
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

  let backgroundTitle(content) = {
    align(
      center,
      box(
        fill: primaryColor,
        text(white, size: 1.25em, weight: "bold", upper(content)),
        width: 1fr,
        inset: 0.3em,
      ),
    )
  }

  let italicColorTitle(content) = {
    text(weight: "bold", style: "italic", size: 1.125em, primaryColor, content)
  }

  header(
    title: name,
    subTitle: title,
    backgroundColor: headerBackground,
    titleColor: primaryColor,
    subtitleColor: secondaryColor,
  )
  grid(
    columns: (1fr, 2fr),
    align(
      start,
      leftColumn(
        contacts,
        sidebar,
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
      ),
    ),
    align(
      start,
      rightColumn(
        main,
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
      ),
    ),
  )

  set par(justify: true)


  // Main body.
  set par(justify: true)
  show: columns.with(3, gutter: 1.3em)

  // body
}
