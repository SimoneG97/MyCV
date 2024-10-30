#import "@preview/fontawesome:0.5.0": *

#let contact(text: "", link: none, icon: "") = {
  (text: text, link: link, icon: icon)
}

#let contactSection(contacts, iconColor: black, textColor: black) = {
  contacts
    .map(c => {
        let t = text(textColor, c.text)

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
    titleColumn,
  )
}

#let leftColumn(contacts, iconColor: black, textColor: black) = {
  let sectionHeader = block(
    text(
      "CONTACT",
      iconColor,
      size: 1.3em,
      weight: "extrabold",
      tracking: 0.1em,
    ),
  )
  box(
    sectionHeader + contactSection(
      contacts,
      iconColor: iconColor,
      textColor: textColor,
    ),
    inset: 1.3em,
    stroke: (right: stroke(thickness: 0.5pt)),
  )
}

#let project(
  headerColor: rgb("#4273B0"),
  textColor: black,
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
        fill: headerColor,
        text(white, size: 1.25em, weight: "bold", upper(content)),
        width: 1fr,
        inset: 0.3em,
      ),
    )
  }

  let secondaryTitle(content) = {
    text(weight: "bold", size: 1.125em, upper(content))
  }

  let italicColorTitle(content) = {
    text(weight: "bold", style: "italic", size: 1.125em, headerColor, content)
  }


  let formattedName = block(
    upper(
      text(
        2.3em,
        weight: "bold",
        headerColor,
        name,
        tracking: 0.05em,
        font: "Glacial Indifference",
      ),
    ),
  )

  let formattedTitle = block(
    upper(text(1.5em, weight: "bold", tracking: 0.05em, rgb("#545454"), title)),
  )

  let titleColumn = align(center)[
    #formattedName
    #formattedTitle
  ]

  let contactColumn = align(center)[#contacts.map(c => {
      if c.link == none [
        #c.text\
      ] else [
        #underline(link(c.link, text(headerColor, c.text)))\
      ]
    }).join()]

  header(
    title: name,
    subTitle: title,
    backgroundColor: headerBackground,
    titleColor: headerColor,
    subtitleColor: textColor,
  )
  grid(
    columns: (1fr, 1fr),
    align(
      start,
      leftColumn(contacts, iconColor: headerColor, textColor: textColor),
    ),
  )

  set par(justify: true)

  let formattedLanguageSkills = [
    #text(skills.languages.join(" • "))
  ]

  let createLeftRight(left: [], right: none) = {
    if (right == none) {
      align(start, text(left))
    } else {
      grid(
        columns: (1fr, 1fr),
        align(start, text(left)), align(end, right),
      )
    }
  }

  //  let parseContentList(contentList) = {
  //    if contentList.format == "bulletJoin" [
  //      #text(contentList.content.join(" • "))
  //    ] else if contentList.format == "bulletList" [
  //      #contentList.content.map(c => list(c)).join()
  //    ]
  //  }

  let parseSubSections(subSections) = {
    subSections
      .map(s => {
          [
            #createLeftRight(
              left: secondaryTitle(s.title),
              right: if s.titleEnd != none {
                italicColorTitle(s.titleEnd)
              },
            )
            #if s.subTitle != none or s.subTitleEnd != none [
              #text(
                top-edge: 0.2em,
                createLeftRight(
                  left: italicColorTitle(s.subTitle),
                  right: s.subTitleEnd,
                ),
              )
            ]
            #s.content
          ]
        })
      .join()
  }

  let parseSection(section) = {
    section
      .map(m => {
          [
            #backgroundTitle(m.title)
            #parseSubSections(m.content)
          ]
        })
      .join()
  }

  let mainSection = parseSection(main)
  let sidebarSection = parseSection(sidebar)


  grid(
    columns: (1fr, 2fr),
    column-gutter: 1em,
    sidebarSection, mainSection,
  )

  // Main body.
  set par(justify: true)
  show: columns.with(3, gutter: 1.3em)

  // body
}
