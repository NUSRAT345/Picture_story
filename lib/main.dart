import 'package:flutter/material.dart';
import 'package:picture_story/text_to_speech.dart';
void main() {
  runApp(PictureStoryApp());
}

class PictureStoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picture Story Time',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StoryLibraryScreen(),
    );
  }
}

class StoryLibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Story Library'),
      ),
      body: ListView.builder(
        itemCount: storyList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the story viewer screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      StoryViewerScreen(story: storyList[index]),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset(
                    storyList[index].coverImage,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    storyList[index].title,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class StoryViewerScreen extends StatelessWidget {
    TextToSpeech textToSpeech = TextToSpeech();
  final Story story;

  StoryViewerScreen({required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(story.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              story.coverImage,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                story.content,
                style: TextStyle(fontSize: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                textToSpeech.speak(story.content);
              },
              child: Text('Read Aloud'),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () => textToSpeech.stopSpeak(),
             child: Text("Stop")
            )
          ],
        ),
      ),
    );
  }
}

class Story {
  final String title;
  final String coverImage;
  final String content;

  Story({required this.title, required this.coverImage, required this.content});
}

// Dummy data
List<Story> storyList = [
  Story(
      title: 'The Adventure of Alex',
      coverImage: 'assets/adventure1.png',
      content:
          'In the bustling town of Crestville, there lived a young and spirited adventurer named Alex. From a young age, Alexs imagination knew no bounds, and they were always yearning for exciting escapades. Their heart raced at the mere thought of uncharted territories and hidden treasures waiting to be discovered.'
          'One fateful day, as Alex was rummaging through old books in the attic, they stumbled upon a tattered map. The map depicted a mysterious island called Seraphia, rumored to hold ancient artifacts of unimaginable power. Alexs eyes gleamed with excitement as they traced the faded lines with their fingers.'
          'Determined to unravel the secrets of Seraphia, Alex wasted no time. They gathered supplies, bid farewell to their family and friends, and set sail on a small ship named "The Star Seeker." The open sea stretched before them, a canvas of possibilities awaiting their brushstrokes of adventure.'
          'Days turned into weeks as Alex navigated the unpredictable waves, facing storms that tested their resolve. But their spirit remained unbroken. One night, guided by the stars above, they spotted the faint outline of an island on the horizon. Seraphia was within their reach.'
          'Upon reaching the shores of the mysterious island, Alex was greeted by a lush and vibrant landscape unlike any they had ever seen. Exotic plants and rare creatures filled the air with an intoxicating aroma. The island seemed to pulse with an energy that spoke of untold secrets.'
          'As Alex ventured deeper into the heart of Seraphia, they encountered a tribe of wise elders who guarded the islands ancient knowledge. The elders spoke of a series of challenges that one must overcome to gain access to the islands inner sanctum, where the coveted artifacts were said to be housed.'
          'Undaunted, Alex faced each challenge head-on. They scaled towering cliffs, traversed treacherous ravines, and deciphered cryptic riddles that tested their wit. Along the way, they formed a bond with Kira, a fellow adventurer who shared their passion for discovery.'
          'After overcoming the final trial, Alex and Kira entered the inner sanctum. They stood in awe as they beheld the artifacts gleaming with an otherworldly radiance. A brilliant, jewel-encrusted amulet known as the "Heart of Seraphia" was rumored to grant its bearer the ability to understand the languages of all creatures.'
          'As Alex reached out to touch the amulet, a voice echoed in their mind. It was the spirit of the island itself, speaking in a melodic language that resonated with their soul. The island shared its history, its joys and sorrows, and its longing to be protected from those who sought to exploit its magic.'
          'Touched by the islands plea, Alex made a choice that would forever shape their legacy. They decided not to take the amulet but instead to become its guardian. With the islands blessing, they pledged to ensure its preservation and to share its wonders with the world while safeguarding its secrets.'
          'Years passed, and Alex returned to Crestville as a seasoned explorer. They regaled the townspeople with tales of Seraphias beauty and magic, inspiring others to embark on their own journeys of discovery. The attic where the adventure had begun became a haven for dreamers and explorers, each finding their own path to adventure.'
          'And so, the story of Alex, the intrepid adventurer, lived on as a testament to the power of curiosity, courage, and the willingness to protect the extraordinary. As long as there were dreams to chase and mysteries to unravel, the spirit of adventure would forever burn bright in the heart of Crestville and beyond.'
    ),
      Story(
        title: 'A Lion and A Mouse', 
        coverImage: 'lionAndMouse.png', 
        content: 'A Lion lay asleep in the forest, his great head resting on his paws. A timid little Mouse came upon him unexpectedly, and in her fright and haste to get away, ran across the Lions nose. Roused from his nap, the Lion laid his huge paw angrily on the tiny creature to kill her.'
        '"Spare me!" begged the poor Mouse. "Please let me go and some day I will surely repay you."The Lion was much amused to think that a Mouse could ever help him. But he was generous and finally let the Mouse go.Some days later, while stalking his prey in the forest, the Lion was caught in the toils of a hunters net.'
        'Unable to free himself, he filled the forest with his angry roaring. The Mouse knew the voice and quickly found the Lion struggling in the net. Running to one of the great ropes that bound him, she gnawed it until it parted, and soon the Lion was free."You laughed when I said I would repay you," said the Mouse.' 
        '"Now you see that even a Mouse can help a Lion."'
        'A kindness is never wasted.'
      ),
    Story(
      title: 'Monkey and The capseller', 
      coverImage: 'CapsellerAndMonkey.png', 
      content: 'Once upon a time, a cap seller was traveling by walk by way of a forest to a village. It was a very warm day and so he chose to lay down under a tree and take sleep for sometime till the sun sets down. As he was extremely tired he slept quickly.When he was sleeping several monkeys came down the tree and'
      'pulled the cap seller’s bag. They opened the bag and found the colourful caps inside. The monkeys picked up the caps and climbed back up the trees. The cap seller woke up after sometime and was surprised to find his opened bag and the monkeys all using his caps.The cap seller became very upset, he shouted at the monkeys'
      'in the tree. The monkeys yelled back at him. This made the cap seller much more irritated. He picked up few stones from the ground and threw them at the monkeys. This time the monkeys threw the fruits they had in their hands at the cap seller.The cap seller was shocked at this actions of the monkeys. He thought for a while.'
      'This time, he taken off off the cap, he was wearing and threw it on the ground. The monkeys that were seeing him also did exactly the same. They threw all the caps on the ground.The clever cap seller collected all the caps, filled them back in his travelling bag and moved away from that location.',
      ),
    Story(
      title: 'Rabbit and Tortoise',
      coverImage: 'RabbitAndTortoise.png',
      content: 'Once upon a time a Tortoise and a Rabbit had an argument about who was faster.They decided to settle the argument with a race. They agreed on a route and started off the race. The rabbit shot ahead and ran briskly for some time. Then seeing that he was far ahead of the tortoise, he thought he would sit under a tree for'
      'some time and relax before continuing the race. He sat under the tree and soon fell asleep. The tortoise plodding on overtook him and soon finished the race, emerging as the undisputed champ. The rabbit woke up and realized that he would lost the race.”'
      ),
      Story(
        title: 'The Thirsty Crow',
        coverImage: 'TheThirstyCrow.png',
        content: 'One hot day, a thirsty crow flew all over the fields looking for water. For a long time, he could not find any. He felt very weak, almost lost all hope. Suddenly, he saw a water jug below the tree. He flew straight down to see if there was any water inside. Yes, he could see some water inside the jug!'
        'The crow tried to push his head into the jug. Sadly, he found that the neck of the jug was too narrow. Then he tried to push the jug to tilt for the water to flow out, but the jug was too heavy.The crow thought hard for a while. Then, looking around it, he saw some pebbles. He suddenly had a good idea.'
        'He started picking up the pebbles one by one, dropping each into the jug. As more and more pebbles filled the jug, the water level kept rising. Soon it was high enough for the crow to drink. His plan had worked!'
        'Moral: Think and work hard, you may find solution to any problem.'
        ),
  // Add more stories here
];

