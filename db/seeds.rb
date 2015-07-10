# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Article.all_delete

article1 = Article.create(header: "Things Patients Have Learned", author:"Jane Bloggs", content: "Why Stop the Thyroid Madness was started 

Since the early 1960’s, it turns out that many thyroid patients have had problems, yet our doctors either proclaimed us “normal”, or said our symptoms were due to something else, and bandaided them with more and more medications.  Something had to be done!  Thanks to the internet, and a group that Janie Bowthorpe started in 2002, thyroid patients started comparing notes, and that lead to discoveries of far better ways to diagnose and treat our hypothyroidism. So Janie began to compile all the reported patient experiences and wisdom on this website, followed by the #1 rated thyroid book with even more details. The purpose?  To create better informed patients who, in turn, can take this information into their doctors offices and create change in their treatment.

The two main problems: T4-only medications, and the TSH lab test  

a) T4-only medications have a miserable history as reported by all too many patients, leaving us with our own degree and kind of lingering symptoms of hypothyroidism…sooner or later. More in Chapter 1 of the revised STTM book. b) The TSH lab test result can be “normal” for years while we suffer from clear hypothyroid symptoms. Even worse, using it while on thyroid meds seemed to STILL keep us hypothyroid! See Chapter 4 about the TSH. 

Natural Desiccated Thyroid–a better treatment is discovered!   

All along, there was always a treatment which worked better, as strongly reported by patients–natural desiccated thyroid.  Changing over to this simple, regulated, consistent and quality natural medication has changed lives!  It has exactly what our own thyroid would make: T4, T3, T2, T1 and calcitonin. Some uninformed doctors will exclaim that it’s complicated, unregulated, inconsistent and unreliable. NOT SO, say patients!  You can see all the known brands and ingredients here, and more about which to take here. Even working with your doctor in adding synthetic T3 to your T4 has shown to be much better choice, say patient experiences. Chapter 2 in the revised STTM book has more detail. 

")

article2 = Article.create(header: "TSH – Why It’s Useless", author:"Jane Doe", content: "The TSH (Thyroid Stimulating Hormone) lab test:

It’s been around since the early 1970’s and has been touted as the gold standard to ascertain your thyroid state, or to know whether you are adequately treated according to a “normal” range. .

And talk to any Endocrinologist or most medical-school-trained doctors, and you will be told the following: 

The TSH lab is a reliable physiological marker of thyroid function (i.e. whether you are hypo or hyper)
It’s an accurate guide for your medication supplementation amount.
The lower your TSH while on desiccated thyroid, the greater your chance of osteoporosis or heart attack.
There’s an optimal place to be on the TSH range when on meds, such as between 1 and 2, or ‘fill-in-the-blank’.
But, reported experiences of patients have found ALL THE ABOVE to be totally false!

Granted, you can have a high TSH and finally find out that you are hypothyroid. But…not only are patients with OBVIOUS hypothyroid symptoms being told they have no thyroid problem because of a “normal” TSH (i.e. a TSH number in range), they are being held hostage to the TSH range when on thyroid medications, even though the patient continues to have typical hypothyroid symptoms while in the range.

WHAT IS THE TSH?

In your body, the actual Thyroid Stimulating Hormone (TSH) is synthesized and secreted by your pituitary gland…i.e. it’s a “pituitary” hormone, NOT a thyroid hormone. You can view the TSH like a messenger sent to knock on the door of the thyroid. And its purpose is to regulate your thyroid gland–to tell it to produce more, or to tell it to produce less. In a healthy individual, its message is based on whether your blood levels have too little thyroid hormones to meet the demands of your body, or too much. When the thyroid gland becomes diseased or disabled and fails to do its job adequately (called hypothyroidism), the TSH knocks and knocks on the door, and theoretically, the TSH lab will show a high number. Or, if the thyroid gland gets on its exercise bicycle and overproduces thyroid hormones (called hyperthyroidism), the TSH lab will theoretically go low to show that the TSH in your body isn’t knocking. Occasionally, patients will have a very low TSH (such as 1 or less) along with a low in range free T3, plus with hypothyroid symptoms, and that can point to a problem in the Pituitary gland, called Hypopituitary. The latter is usually due to a diseased pituitary gland, or a problem with the Hypothalamus, which is the organ that sends it’s messenger to the Pituitary. (The Hypothalamus, Pituitary and Thyroid glands make up with is called a Feedback Loop.)")

  puts "seeded!"