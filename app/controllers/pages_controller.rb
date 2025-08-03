class PagesController < ApplicationController
  require 'ostruct'
  
  def home
    @is_home = true
    @projects = Project.featured_and_published
  end

  def about
    file_path = Rails.root.join("public/professional_experience.json")
    json = File.read(file_path)
    @experiences = JSON.parse(json, symbolize_names: true)

    @skills = {
      "Design Tools" => ["Figma", "FigJam", "Miro", "Storybook", "Design Tokens", "Adobe Creative Suite", "Sketch"],
      "Research & Testing" => ["User Interviews", "Usability Testing", "A/B Testing", "Google Analytics", "Hotjar", "Maze", "3m Tracking"],
      "Development" => ["HTML/CSS", "JavaScript", "Git", "Rails", "React (Basic)", "PHP", "Design System"],
      "Collaboration" => ["Agile/Scrum", "Design Thinking", "Workshop Facilitation", "Stakeholder Management", "Mentoring", "Jira"]
    }

    @education_history = [
      {
        course: "Bachelor of Science (Hons) - Computer Science",
        institution: "University of Magee",
        from: "Sept 2006",
        to: "Jun 2010",
        location: "Derry, Northern Ireland",
        description: "For my Final year project, I designed and developed an interface using an Infrared LED sensor and a number of Infrared LEDS. The concept of the project was to allow the user to utilise their computer from a distance away from the shackles of a surface a keyboard or laptop through the use of simple gestures. The project was successful as I was asked to represent Magee at the S.T.E.M technology exhibition in the Odyssey Arena Belfast (21-06-2010). For my Final year project, I designed and developed an interface using an Infrared LED sensor and a number of Infrared LEDS. The concept of the project was to allow the user to utilise their computer from a distance away from the shackles of a surface a keyboard or laptop through the use of simple gestures. The project was successful as I was asked to represent Magee at the S.T.E.M technology exhibition in the Odyssey Arena Belfast (21-06-2010). "
      }
    ]

    @philosophies = [
      { icon: 'users', title: 'User Centered', text: 'Every design decision starts with understanding user needs, behaviours and pain points through research and empathy' },
      { icon: 'target', title: 'Purpose Driven', text: 'Design should solve real problems and create meaningful value for both users and businesses' },
      { icon: 'bolt', title: 'Iterative', text: 'Great design emerges through continuous testing, learning and refinement based on real user feedback' }
    ]
  end


  def contact
    @faqs = [
      { question: "What development experience do you have?", answer: "I have over 15 years experience coding sites and applications in languages such as, PHP, Rails, TypeScript and React. Professionally I have over 10 years experience and although I have transitioned to a design role I still enjoy coding in my free time." },
      { question: "How did you get into UX?", answer: "During my time at Learning Pool, I championed for the introduction of a dedicated UX process, which opened up the opportunity for me to split my time between development and design. That was until I moved full time into design as Learning Pool saw just how valuable the UX process can be." },
      { question: "What tools do you use?", answer: "I typically work with Figma in my day to day design work. That said, I also use a myrid of other tools like Google/MS forms, Miro, FigJam, Hotjar, 3M, Amplitude and Adobe Suite." },
      { question: "Have you any experience building design systems from scratch?", answer: "Yes, I have lead, managed and maintained the formation of a design system and its design tokens at both Learning Pool and Omniplex Learning." },
      { question: "Hybrid or remote work?", answer: "For a role outside of Ireland I would require a remote first position. For companies based in Ireland I would be more than happy to work from an office provided it is within driving distance of a daily commute or witin an 80 mile distance of Derry City. I would also happily travel once a month or quarterly for roles outside of Ireland. " },
      { question: "Have you managed others?", answer: "Yes, when I built out the UX team at Learning Pool I was reponsible for 9 others within the team. Their skills ranged from design, to research and even to developers." }
    ]
  end

  def projects
  end
end
