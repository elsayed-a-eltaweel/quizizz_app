class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question": "What do you call a baby bat?______",
    "answer_index": 1,
    "options": ["Cub", "Pup", "Chick", "Kid"]
  },
  {
    "id": 2,
    "question": "How many legs do butterflies have?______",
    "answer_index": 3,
    "options": ["2", "4", "0", "6"]
  },
  {
    "id": 3,
    "question":
        "Hippocampus is the Latin name for which marine creature?______",
    "answer_index": 0,
    "options": ["Seahorse", "Dolphin", "Whale", "Octopus"]
  },
  {
    "id": 4,
    "question": "What is Grumpy Cats real name?______",
    "answer_index": 2,
    "options": ["Sauce", "Minnie", "Tardar Sauce", "Broccoli"]
  },
  {
    "id": 5,
    "question": "What is the name of a rabbits abode?______",
    "answer_index": 1,
    "options": ["Nest", "Burrow", "Den", "Dray"]
  },
  {
    "id": 6,
    "question": "What color is the female blackbird?______",
    "answer_index": 3,
    "options": ["Black", "White", "Yellow", "Brown"]
  },
  {
    "id": 7,
    "question": "By definition, where does an abyssopelagic animal live?______",
    "answer_index": 0,
    "options": [
      "At the bottom of the ocean",
      "In the desert",
      "On top of a mountain",
      "Inside a tree"
    ]
  },
  {
    "id": 8,
    "question":
        "The Kakapo is a large, flightless, nocturnal parrot native to which country?______",
    "answer_index": 2,
    "options": ["South Africa", "Australia", "New Zealand", "Madagascar"]
  },
  {
    "id": 9,
    "question": "What is the scientific name for modern day humans?______",
    "answer_index": 0,
    "options": [
      "Homo Sapiens",
      "Homo Ergaster",
      "Homo Erectus",
      "Homo Neanderthalensis"
    ]
  },
  {
    "id": 10,
    "question": "What is the fastest  land animal?______",
    "answer_index": 1,
    "options": [
      "Lion",
      "Cheetah",
      "Thomson&rsquo;s Gazelle",
      "Pronghorn Antelope"
    ]
  }
  // {
  //   "id": 1,
  //   "question":
  //       "Flutter is an open-source UI software development kit created by ______",
  //   "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
  //   "answer_index": 1,
  // },
  // {
  //   "id": 2,
  //   "question": "When google release Flutter.",
  //   "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
  //   "answer_index": 2,
  // },
  // {
  //   "id": 3,
  //   "question": "A memory location that holds a single letter or number.",
  //   "options": ['Double', 'Int', 'Char', 'Word'],
  //   "answer_index": 2,
  // },
  // {
  //   "id": 4,
  //   "question": "What command do you use to output data to the screen?",
  //   "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
  //   "answer_index": 2,
  // },
  // {
  //   "id": 5,
  //   "question": "What is the powerhouse of the cell?",
  //   "options": ["Mitochondria", "Ribosome", "Redbull", "Nucleus"],
  //   "answer_index": 0,
  // },
  // {
  //   "id": 6,
  //   "question":
  //       "What is the name of the Boeing B-29 that dropped the &#039;Little Boy&#039; atomic bomb on Hiroshima?",
  //   "options": [
  //     "Necessary Evil",
  //     "Enola Gay",
  //     "The Great Artiste",
  //     "Full House"
  //   ],
  //   "answer_index": "1",
  // },
  // {
  //   "id": 7,
  //   "question":
  //       "In what year was the first &quot;Mass Effect&quot; game released?",
  //   "answer_index": 1,
  //   "options": ["2008", "2007", "2009", "2010"]
  // },
  // {
  //   "id": 8,
  //   "question":
  //       "Mobile hardware and software company &quot;Blackberry Limited&quot; was founded in which country?",
  //   "answer_index": 1,
  //   "options": [
  //     "Norway",
  //     "Canada",
  //     "United States of America",
  //     "United Kingdom"
  //   ]
  // },
  // {
  //   "id": 9,
  //   "question":
  //       "Which animal features on the logo for Abarth, the motorsport division of Fiat?",
  //   "answer_index": 2,
  //   "options": ["Snake", "Bull", "Scorpion", "Horse"]
  // },
  // {
  //   "id": 10,
  //   "question":
  //       "According to a song by Belinda Carlisle, Heaven is a place on what?",
  //   "answer_index": 0,
  //   "options": ["Earth", "Venus", "Mars", "Uranus"]
  // },
  // {
  //   "id": 11,
  //   "question": "What African country has Portuguese as its official language?",
  //   "answer_index": 3,
  //   "options": ["Botswana", "Gabon", "Togo", "Mozambique"]
  // },
  // {
  //   "id": 12,
  //   "question": "Who was the winner of &quot;Big Brother&quot; Season 10?",
  //   "answer_index": 2,
  //   "options": [
  //     "Bryce Kranyik",
  //     "Ryan Sutfin",
  //     "Dan Gheesling",
  //     "Chris Mundorf"
  //   ]
  // }
];
