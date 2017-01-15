//
//  LockedCounter.swift
//  Simply Write
//
//  Created by Adam Short on 28/12/16.
//  Copyright © 2016 Adam Short. All rights reserved.
//

import UIKit

class Motivational: UIViewController {
   
   @IBOutlet weak var streaklabel: UILabel!
   
   @IBOutlet weak var phraseHeader: UILabel!
   @IBOutlet weak var phraseBody: UILabel!
   @IBOutlet weak var wordsRecorded: UILabel!
   
   //The pairs are in order of appearance - sequentially shown as a user progresses.
   let displayPairs: [(header: String, body: String)] = [
      ("The Start", "Today you began a journey towards a better you. The only way to get better at communication (in all of its forms) is through practise -  and the written word is the easiest. Let's see how long you can go!"),
      ("Bringing it back!", "Congratulations! The second day is always the hardest. It's easy to call it quits - but you didn't. Thankfully, for each day that you write, it gets easier to write the day after. Achievement chaining, baby!"),
      ("Congratulations!", "You may not feel like it, but you've already written #TTAL words in the last 3 days. Keep it rolling!"),
      ("Progress is building","For 4 days now, you've hit your target. 3 Days left and you'll be a week strong. You can do it."),
      ("Practised Communication", "Humans are lingustic creatures. We are distingushed from other animals by our ability to conceptualize topics in languages and discuss them with others. This sharing of knowledge - this human gift- is what you have been working on for 5 days now."),
      ("A better leader", "One of the key traits of an effective leader is being able to clearly articulate your thoughts. By writing prose or essay pieces daily, you are improving this skill. You'll also expand your vocabulary - a key trait of intelligence."),
      ("1 Week In", "Congratulations - today is a big milestone. You've written consistently every day for 7 days now. You should be able to feel the momentum building by now, and your writing skills improving. Good work."),
      ("Tell Others","One way to commit to a goal is to tell others of your intentions. By sharing your ambitions with others you make them seem more solid and real to yourself - and you also feel a sense of accountability. If you're lacking in willpower, try it out."),
      ("Art of Routine", "By writing day after day in a consistent fashion like you have - for 9 days now - you're developing not just the skill of writing, but of creating good habits. The most successful people are not successful because of talent or luck - simply, they developed a system of routines and habits that benefited them and guided them towards their goals. Now, you are doing the same."),
      ("End of Trial","If you've been using the free 10 day trial, today is your last day. You'll now be asked to activate your subscription on the manage account screen to continue. By investing monetarily in your goal, you'll be more likely to continue when it gets tough - it increases the stakes. Furthermore, 100% of your money will go towards alleviating global povery through the OxFam foundation."),
      ("Try something new.", "If you've been just writing stories or essays each day for the last 11 days, it might help to try a new format of writing. This will accelerate your growth and help develop your communication skills."),
      ("Twelve Days In", "Every day for #DYS days now, you've written #WRDS words. In fact, you've already written #TTAL words. That's incredible - be proud of yourself."),
      ("Restarting","If you've noticed that it's getting easy to write #WRDS words a day, then perhaps it is time to up the antie. Go and crank up your word goal. It'll reset your current streak, but sometimes you have to take a step back in order to go forwards."),
      ("Two Weeks In", "You've already been writing every day for half a month now. Fantastic! Others may even have started to notice the improvement in your communication - written and verbal. Furthermore, if you're aiming for a novel or story - congratulations, you're #TTAL words in."),
      ("The Truth","A famous writer, Dorothy Parker, once said 'I hate writing, I love having written.' It's exceptionally true. The gratification that comes after writing is what we crave - not the act itself. So if you find your daily word goal a slug, don't worry - even proffesional authors feel the same. And they get paid to do it."),
      ("What is your goal?", "Not your word count goal - your actual goal. The reason for writing. Having one will make it easier to stick to the routine. You might be working on a novel, a series of short stories, a collection of poems - or journalistic accounts. Even research essays. Whatever the goal - keep it in mind. You're 16 days in. Keep going."),
      ("Expand your vocab.", "You've written #TTAL words during this streak so far, and #GLBL words over the entire time you've had this app. If you want to take it a step further - start reading daily. Even just 30 minutes will suffice to dramatically accelerate your growth as a writer and as a person."),
      ("Proud of your writing?", "By now, you've probably written at least 1 piece you're particularly proud of. Don't be shy - share it with others. Post it on social media, get some feed back, keep on pushing forward. You've been at this for almost 3 weeks now."),
      ("19 Days In", "For ninteen days now, you've found the time to write #WRDS words a day. Give yourself a pat on the back. You've now got the momentum of almost 3 weeks of writing behind you - don't slow down now.")
      
   ]
   
   let currentStreak = storedData.integer(forKey: "streak")
   let wordGoal = storedData.integer(forKey: "wordGoal")
   let totalWords = storedData.integer(forKey: "totalWords")
   
   override func viewDidLoad() {
      
      let userInformation = [
         "DYS" : currentStreak,
         "WRDS" : wordGoal,
         "TTAL" : currentStreak * wordGoal,
         "GLBL" : totalWords
      ]
      
      streaklabel.text = "\(currentStreak) DAY STREAK"
      phraseHeader.text = displayPairs[currentStreak].header
      phraseBody.text = process(displayPairs[currentStreak].body, values: userInformation)
      wordsRecorded.text = "\(totalWords) words recorded"
      
   }
   
   override func didReceiveMemoryWarning() {
      
   }
   
   @IBOutlet weak var accidentButton: UIButton!
   @IBAction func cancelCompletion(_ sender: Any) {
      accidentButton.backgroundColor = UIColor.white
      UIView.animate(withDuration: 0.3, animations: {
         self.accidentButton.transform = CGAffineTransform(scaleX: 9, y: 40)
      }, completion: { (Bool) -> () in
         storedData.set(self.currentStreak-1, forKey: "streak")
         storedData.set(self.totalWords - self.wordGoal, forKey: "totalWords")
         storedData.set(false, forKey: "goalAchievedToday")
         
         self.performSegue(withIdentifier: "rewindAccident", sender: nil)
      })
   }
   
   
   
}
