import 'package:instazoo/dog/model/dog.dart';
import 'package:instazoo/dog/repo/db_helper.dart';

void loadIfNeeded() {
  DbHelper.instance.queryAllRows().then((dogs) {
    if (dogs.isEmpty) {
      _getAllDogs().forEach((dog) => DbHelper.instance.insert(dog));
    }
  });
}

List<Dog> _getAllDogs() => _dogs;

const List<Dog> _dogs = [
  Dog(
    id: 1,
    icon:
        "http://www.dogbreedslist.info/uploads/allimg/dog-pictures/Labrador-Retriever-1.jpg",
    originIcon: "http://www.dogbreedslist.info/uploads/allimg/flag/Canada.png",
    name: "Labrador Retriever",
    origin: "Canada, USA",
    overview:
        "The Labrador Retriever is a medium-sized, short-coupled, powerfully-built dog with a short, dense, water-resistant coat; small, drop ears; and a short, thick otter-like tail carried level with the back or with a slight upward curve",
    history:
        "The ancestor of the Labrador Retriever was the St. John’s Retriever, a smaller version of the Newfoundland. These dogs were brought to England, probably on fishing boats. Gamekeepers crossed these Canadian imports with various breeds of gun dogs, always striving to improve the breed’s hunting and retrieving instincts. By the middle of the 19th century, the Labrador’s characteristic water-resistant coat and otter tail were already apparent. By the late 1880s, the breed was sufficiently distinctive that “Labrador Retriever” became the generally accepted name of the breed. Originally black in color, the first recorded yellow Labrador appeared in a litter born in 1899. Chocolates were also recorded at about the same time, but never achieved the same level of popularity as the blacks and yellows. Originally bred to retrieve from water, the modern Labrador Retriever has proven to be one of the most versatile breeds, excelling in hunt tests and field trials, in obedience and agility events, and also as service dogs.",
  ),
  Dog(
    id: 2,
    icon:
        "http://www.dogbreedslist.info/uploads/allimg/dog-pictures/German-Shepherd-Dog-1.jpg",
    originIcon: "http://www.dogbreedslist.info/uploads/allimg/flag/Germany.png",
    name: "German Shepherd Dog",
    origin: "Germany",
    overview:
        "The German Shepherds are medium to large-sized dogs, well-balanced, muscular dog, slightly longer than tall, with a medium length coat, erect ears, and a low-set natural tail that normally reaches to the hock and is carried in a slight curve like a saber",
    history:
        "The German Shepherd Dog is a relatively young breed, developed almost single-handedly in the first half of the twentieth century by a German cavalry officer, Max von Stephanitz, president of the Verein far Deutsche Schaferhunde S.V. Using a variety of German sheepdogs as his foundation stock, von Stephanitz developed a distinctive breed in a very short period of time, due in large part to the authoritarian practices of the German dog fancy at that time. Von Stephanitz emphasized utility and intelligence in his breeding program, enabling the German Shepherd Dog to switch easily from herding duties to other fields of work, particularly military and police work. The breed was just gaining notice in the United States when World War I broke out. All things German were shunned and popularity slumped. After the war, however, movie star Rin-Tin-Tin stimulated interest in the breed again. The striking good looks of this breed, combined with its remarkable intelligence and loyalty, have made it a favorite working and companion dog.",
  ),
  Dog(
    id: 3,
    icon:
        "http://www.dogbreedslist.info/uploads/allimg/dog-pictures/Golden-Retriever-1.jpg",
    originIcon:
        "http://www.dogbreedslist.info/uploads/allimg/flag/United-Kingdom.png",
    name: "Golden Retriever",
    origin: "United Kingdom",
    overview:
        "The Golden Retriever is a medium-sized, well-balanced dog with a distinctive golden-colored coat; small, drop ears; and a natural tail carried level with the back or with a slight upward curve",
    history:
        "Originating in the Scottish Highlands in the late 1800s, the Golden Retriever was developed by Lord Tweedmouth, by crossing the original yellow Flat-Coated Retriever with the now extinct Tweed Water Spaniel. He later crossed in the Bloodhound, Irish Setter and more Tweed Water Spaniel. The dogs were called the Golden Flat-Coat and only later were they given the name Golden Retriever. The Golden Retriever is one of the most popular breeds known today, not only as family companions but for obedience competitions, hunting and tracking, as a birddog on both land and in the water, narcotics detection, service dog for the disabled, a guide for the blind and as a therapy dog. The Golden Retriever was first recognized by the AKC in 1925.",
  ),
  Dog(
    id: 4,
    icon:
        "http://www.dogbreedslist.info/uploads/allimg/dog-pictures/French-Bulldog-1.jpg",
    originIcon: "http://www.dogbreedslist.info/uploads/allimg/flag/France.png",
    name: "French Bulldog",
    origin: "France",
    overview:
        "The Frenchie shares many of the traits that made its bulldog ancestors so successful in the bull-baiting arena: low center of gravity, wide body, heavy bone, muscular build and large, square head",
    history:
        "The French Bulldog originated in 19th Century Nottingham, England, where lace makers decided to make a smaller, miniature, lap version of the English Bulldog that was referred to as a 'toy' bulldog. In the 1860s, when the Industrial Revolution drove the craftsmen to France, they took their dogs with them. The toy bulldogs became popular in France and were given the name the 'French Bulldog.' The breed eventually made its way back to England for dog shows. The Brits were not happy with the name 'French' given to a dog that was originally from England, however the name 'French Bulldog' stuck.",
  ),
  Dog(
    id: 5,
    icon:
        "http://www.dogbreedslist.info/uploads/allimg/dog-pictures/Bulldog-1.jpg",
    originIcon:
        "http://www.dogbreedslist.info/uploads/allimg/flag/United-Kingdom.png",
    name: "Bulldog",
    origin: "United Kingdom",
    overview:
        "The English Bulldog is a wide, medium-sized, compact dog with short legs. The body and head are massive with extra skin on both the skull and forehead falling in folds",
    history:
        "The English Bulldog (or simply ‘Bulldog’) was bred in England in the 1500’s for bull baiting, a popular gambling ‘sport’ in which one or more dogs were matched up against a chained bull (or bear). These dogs were bred for sheer fighting capacity, and they were famed for latching onto their prey with an iron jaw which they refused to release—they could even suffocate opponents this way. English Bulldogs fell in popularity when bull baiting was outlawed in the 1830’s, but a committed group of devotees kept the breed alive and selected away any trace of ferocity. Easily recognizable by their distinctive and adorable ‘sourmug’, English Bulldogs serve as the mascots of dozens of sports teams, most famously Georgetown University. Other famous English Bulldogs include Handsome Dan, the Yale mascot, and Tyson, the skateboarding Bulldog of internet fame. English Bulldogs are simultaneously a symbol of British tenacity and an immensely popular American pet.",
  ),
  Dog(
    id: 6,
    icon:
        "http://www.dogbreedslist.info/uploads/allimg/dog-pictures/Beagle-1.jpg",
    originIcon:
        "http://www.dogbreedslist.info/uploads/allimg/flag/United-Kingdom.png",
    name: "Beagle",
    origin: "United Kingdom",
    overview:
        "The beagle should look like a miniature foxhound, solid for its size. The beagle's moderate size enables it to be followed on foot",
    history:
        "The first Beagles date back to the 1500s. English hunters would take packs of these dogs out on the hunt tracking rabbits, hare, pheasant, quail and other small animals. The breed probably originated as a cross between the Harrier and other types of English hounds. The dogs have since become one of the most popular breeds in the USA. The breed can hunt alone, in pairs or in packs. The name 'Beagle' may have come from the French term 'be’geule' which means “gape throat,” referring to the dogs baying voice. The name may also have come from the dog's size, stemming from the French word “beigh,” the Old English word “begele,” or perhaps the Celtic word “beag,” which all mean 'small.' He has also served as an excellent narcotics detection dog and makes a fine family companion. They were first recognized by the AKC in 1885.",
  ),
  Dog(
    id: 7,
    icon:
        "http://www.dogbreedslist.info/uploads/allimg/dog-pictures/Poodle-1.jpg",
    originIcon: "http://www.dogbreedslist.info/uploads/allimg/flag/France.png",
    name: "Poodle",
    origin: "France",
    overview:
        "The Standard Poodle is a medium-sized, squarely built dog with a distinctive harsh curly coat that may be presented in any of several traditional Poodle clips or corded",
    history:
        "France has been officially recognized as the Poodle’s country of origin, but the Poodle’s earlier ancestors came from central Asia. The German variety has probably influenced the modern breed most (‘Poodle’ is German for ‘splash’ or ‘puddle’). In 18th and 19th century Europe, the Poodle served a wide variety of purposes, including duck hunting, guiding, and later circus performing, from whence the modern grooming style likely arose. The Poodle became a popular pet for the French aristocracy, and in time was officially adopted as the national dog. Poodles were imported to America in the 20th century. They slowly rose in popularity and eventually became the country’s most popular dog. The poodle is a group of formal dog breeds, the Standard Poodle, Miniature Poodle and Toy Poodle. The origins of the poodles are still discussed with a dispute over whether the poodle descends from the old French Barbet breed or from Germany as a type of water dog.",
  ),
];
