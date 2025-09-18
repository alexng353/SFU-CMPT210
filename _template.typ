#let conf(
  title: "",
  number: "",
  lecturer: "", 
  author: "",
) = {
  set heading(numbering: "1.")

  align(center, text(17pt)[
    *#title*\
    Lecture #number
  ])

  grid(
    columns: (1fr, 1fr),
    align(center)[
      Lecturer: #lecturer\
      Simon Fraser University
    ],
    align(center)[
      Notetaker: #author\
      Simon Fraser University
    ]
  )
}
