const user = {
  name: "Piyush Sharma",
  designation: "Senior Software Engineer",
  company: "Infuse Consulting",
  hobbies: ["Reading", "Listening to music", "Collecting stamps"],
};

const printUserProfile = () => {
  const { name, designation, company, hobbies } = user;
  const hobbiesString = hobbies.slice(0, -1).join(", ") + (hobbies.length > 1 ? " and " : "") + hobbies.slice(-1);
  console.log(`${name} is a ${designation} at ${company}. He likes ${hobbiesString}.`);
};

printUserProfile();
