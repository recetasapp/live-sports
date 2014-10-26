module Helpers

  DATA = {
    version: "65559902540000_c83f983fc_en_2_1",
    sports: [
      {id: 1, title: "Football", pos: 3,
        events: [
          {id: 11, outcomes: [
            {id: 111, description: "Elche", price: "5/1"},
            {id: 112, description: "Draw", price: "10/3"},
            {id: 113, description: "Alicante", price: "1/2"}
          ],title: "Elche v Alicante", score: "0 - 0", meeting: "ES Regional Division League", status: "First Half", pos: 3},
          {id: 12, outcomes: [], title: "Horn v Breda", score: "2 - 1", meeting: "NL League", status: "Second Half", pos: 2},
          {id: 13, outcomes: [], title: "Rafal v Benejuzar", score: "2 - 0", meeting: "ES Third Division League", status: "Second Half", pos: 1}
        ],
      },
      {id: 2, title: "Horse Racing", pos: 2,
        events: [
          {id: 21, outcomes: [
            {id: 211, description: "CABEZA HUECA", price: "9/1"},
            {id: 212, description: "RAUDO", price: "15/2"},
            {id: 213, description: "VELOZ", price: "28/1"}
          ],title: "RAFAL (Spain) 12:00", score: "", meeting: "RAFAL (Spain)", status: "Race", pos: 3},
          {id: 22, outcomes: [], title: "BENEJUZAR (Spain) 13:10", score: "", meeting: "BENEJUZAR (Spain)", status: "13:10", pos: 2},
          {id: 23, outcomes: [], title: "ALMORADI (Spain) 13:25", score: "", meeting: "ALMORADI (Spain)", status: "13:25", pos: 1}
        ],
      },
      {id: 3, title: "Tennis", pos: 1,
        events: [
          {id: 31, outcomes: [
            {id: 311, description: "Nadal", price: "1/9"},
            {id: 312, description: "Federer", price: "9/1"}
          ],title: "Nadal v Federer", score: "1 - 0", meeting: "Rafal Series - 2014", status: "2-0", pos: 3},
          {id: 32, outcomes: [], title: "Nicolas v Herrero", score: "40 - 40", meeting: "Alicante Mens - 2014", status: "0-1", pos: 2},
          {id: 33, outcomes: [], title: "Rosa v Valeria", score: "15 - 0", meeting: "Alicante Womens - 2014", status: "6-3 6-7", pos: 1}
        ],
      }
    ]
  }

end
