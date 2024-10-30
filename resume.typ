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

#set text(font: "Lato")

#show: project.with(
  headerBackground: rgb("#dbefff"),
  primaryColor: rgb("#163853"),
  secondaryColor: rgb("#545454"),
  name: "Andrea Maria Piana",
  title: "Team & Technical Lead",
  contacts: (
    contact(text: "+44 741 9845728", icon: "phone"),
    contact(
      text: "andrea.maria.piana@gmail.com",
      link: "mailto:andrea.maria.piana@gmail.com",
      icon: "envelope",
    ),
    contact(
      text: "github.com/cammellos",
      link: "https://www.github.com/cammellos",
      icon: "github",
    ),
    contact(
      text: "Edinburgh, United Kingdom",
      icon: "location-dot",
    ),
  ),
  main: (
    section(
      title: "Profile Summary",
      content: (
        subSection(
          title: "Experienced Engineering Leader with Expertise in
Decentralized Systems and Full-Stack Development",
          content: text("As a technical leader, I have scaled teams, implemented key infrastructure, and driven product strategy at both technical and organizational levels.

I led agile processes for a team that grew from 6 to 24 developers, running daily standups, coordinating sprints, leading retrospectives, and driving estimation sessions to ensure the team consistently delivered high-impact features. By implementing effective agile practices, I fostered a culture of continuous improvement and transparent communication, enhancing collaboration and alignment with product goals. My hands-on leadership style balanced strategic oversight with active engagement in development, enabling the team to scale efficiently while maintaining high standards of quality and productivity.

I played a key role in developing an in-house communication protocol (Waku), and I designed the encryption mechanism for 1-to-1 and private group chats, adapting Signal’s double ratchet protocol for decentralized peer-to-peer networks. I have improved query performance of our SQL backed stores while using metadata preserving techniques to protect the users’ privacy. I authored key specifications for the application-level protocol and delivered full-stack features aligned with company goals.

I’m skilled at managing senior stakeholder relationships, shaping product roadmaps, and mentoring developers to reach their full potential, ensuring both strategic alignment and technical excellence."),
        ),
      ),
    ),
    section(
      title: "Work Experience",
      content: (
        subSection(
          title: "Status.im",
          titleEnd: "Remote",
          subTitle: "Team Lead",
          subTitleEnd: "08/2020-09/2024",
          content: list(
            [Scaled the development team from 6 to 24 members, establishing an efficient hiring pipeline for the status-mobile flagship app (chat/wallet/browser), built in react-native for both IOS and Android.],
            [Provided technical leadership across the mobile frontend (clojurescript/re-frame/react native) and backend (golang), driving architecture and development best practices.],
            [Contributed to product strategy, offering technical insights on feature development and ensuring alignment with business objectives.],
            [Managed relationships with external partners and internal cross-functional teams to ensure seamless collaboration.],
            [Engaged senior stakeholders, supporting the development of the product roadmap and aligning it with broader company strategy.],
            [Mentored and coached new developers, helping them transition into high-impact roles within the organization.],
            [Oversaw team performance evaluations, providing feedback and setting development goals.],
            [Managed team salary and budget allocations, for both new and existing hires.],
            [Collaborated closely with security auditors, successfully passing two thorough security audits focused on key storage, encryption practices, and overall system security.],
            [Implemented best practices for secure key management and encryption, ensuring compliance with industry standards.],
          ),
        ),
        subSection(
          title: "Status.im",
          titleEnd: "Remote",
          subTitle: "Senior Developer",
          subTitleEnd: "05/2018 - 08/2020",
          content: list(
            [Designed and implemented a custom encryption mechanism for 1-to-1 and private group chats, adapting Signal’s double ratchet protocol to function within a decentralized peer-to-peer system.],
            [Led the transition of frontend logic to the backend, optimizing system architecture and performance, building and designing an API for the desktop and mobile client.],
            [Played a pivotal role in developing the in-house communication protocol (waku), contributing to its design and implementation.],
            [Authored specifications and developed key components of the application-level protocol.],
            [Delivered full-stack features aligned with company objectives, ensuring seamless integration with business goals.],
            [Implemented an agnostic decentralized push notification system over the waku protocol, using firebase and APN for the actual delivery of the notifications. https://specs.status.im/raw/16],
            [Implemented WalletConnect V1 integration in the react native mobile app.],
            [Written a smart contract in solidity that managed and rewarded/punished node operators of whisper nodes.],
          ),
        ),
        subSection(
          title: "Signal AI",
          titleEnd: "London",
          subTitle: "Senior Developer",
          subTitleEnd: "2016-2018",
          content: list(
            [Utilized AWS services (SQS, Kinesis, ECS, RDS, Redshift) with a large-scale Elasticsearch deployment (~30 TB).],
            [Wrote and maintained infrastructure using Terraform to manage cloud resources.],
            [Developed components predominantly in Clojure, with Python for machine learning and node.js APIs.],
            [Led a team to implement a low-latency distributed data processing pipeline using a microservices architecture, primarily in Clojure with machine learning components in Python.],
            [Developed a client-facing UI using ClojureScript (re-frame).],
            [Transitioned from a monolithic data processing pipeline to a re-playable, stream-oriented architecture using microservices.],
          ),
        ),
        subSection(
          title: "Mergermarket",
          titleEnd: "London",
          subTitle: "Senior Developer",
          subTitleEnd: "2015-2016",
          content: list(
            [Worked on a client facing real-time notification system for bankruptcy cases, implemented as a collection of microservices witten in Groovy and
              Java.],
            [Built a tracking system for financial activists, implemented in node.js and react.],
          ),
        ),
        subSection(
          title: "77agency",
          titleEnd: "London",
          subTitle: "Lead Developer",
          subTitleEnd: "2011-2015",
          content: list(
            [Led a team of 4 developers in creating the backend and frontend of Allin1social, a Ruby on Rails application, and related services using
              Sinatra and MySQL.],
            [Developed a click tracking system with Node.js and MongoDB.],
            [Allin1social is a Social Media Management tool for Facebook, Twitter, and Google+, which earned the company two Facebook PMD badges: Pages and Insights.],
          ),
        ),
      ),
    ),
  ),
  sidebar: (
    section(
      title: "Technology",
      content: (
        subSection(
          title: "Programming Languages",
          content: list(
            "Clojure, ClojureScript, Golang",
            "Ruby, JavaScript, Node.js",
            "Python, Java, C",
          ),
        ),
        subSection(
          title: "Mobile Development",
          content: list(
            "React Native, RN Native Modules",
            "Firebase",
          ),
        ),
        subSection(
          title: "Web Development",
          content: list(
            "HTML5, CSS, SCSS/SASS",
            "Javascript,Coffeescript,Clojurescript",
            "Re-Frame, React.js, Redux",
          ),
        ),
        subSection(
          title: "Frameworks",
          content: list(
            "Ruby on Rails, Sinatra, Django",
            "Socket.io, Express.js, Phoenix",
          ),
        ),
        subSection(
          title: "Databases",
          content: list(
            "SQL Databases, MongoDB, Redis, Elasticsearch",
            "RethinkDB",
          ),
        ),
        subSection(
          title: "API Integrations",
          content: list(
            "Facebook, Vimeo, Youtube, Weibo, Linkedin",
            "Twitter, Google Analytics, Google AdWords",
            "Paypal, Mercadopago",
            "Infura, Cryptocompare, Pokt/Grove",
          ),
        ),
        subSection(
          title: "Development Tools/Practices",
          content: list(
            "Git, TDD, BDD, Scrum, Kanban, XP",
            "Cucumber, RSpec",
            "Nix, CircleCI, Jenkins",
          ),
        ),
        subSection(
          title: "Server Administration",
          content: list(
            "ECS, Docker, Terraform",
            "Linux, FreeBSD, Nginx",
          ),
        ),
        subSection(
          title: "Cloud Services",
          content: list("AWS (SQS, Kinesis, ECS, RDS, Redshift)"),
        ),
      ),
    ),
    section(
      title: "Leadership Skills",
      content: (
        subSection(
          content: list(
            text(text(
              "Strategic Vision:",
              weight: "bold",
            ) + "  Shaped product strategy and roadmaps"),
            text(text(
              "Technical Guidance:",
              weight: "bold",
            ) + "  Provided
leadership across mobile frontend, backend, and communication protocols."),
            text(text(
              "Project Management:",
              weight: "bold",
            ) + " Led complex projects, including greenfield and system transitions."),
            text(text(
              "Senior Stakeholder Management:",
              weight: "bold",
            ) + "  Effectively managed senior stakeholders and their expectations."),
            text(text(
              "Team Scaling:",
              weight: "bold",
            ) + "  Successfully scaled teams from 6 to 24 and set up hiring pipelines."),
            text(text(
              "Cross-Functional Collaboration:",
              weight: "bold",
            ) + "  Managed relationships with internal and external stakeholders"),
            text(text(
              "Hands-On Leadership:",
              weight: "bold",
            ) + "  Balanced team empowerment with direct codebase involvement."),
            text(text(
              "Mentorship:",
              weight: "bold",
            ) + "  Coached new developers into impactful roles."),
            text(text(
              "Innovation:",
              weight: "bold",
            ) + "  Spearheaded development and adaptation of key technologies and protocols"),
            text(text(
              "Team Engagement and Collaboration:",
              weight: "bold",
            ) + "  Fostered team engagement through open communication in 1:1 meetings, and facilitated reflective and productive retrospectives and team meetings."),
          ),
        ),
      ),
    ),
    section(
      title: "Education",
      content: (
        subSection(
          title: [
            #set par(justify: false)
            University of Edinburgh
          ],
          subTitle: "BEng in Computer Science",
          content: [
            Graduated: May 2011\
          ],
        ),
      ),
    ),
  ),
)

