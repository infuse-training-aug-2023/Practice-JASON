const user = {
  name: "Piyush Sharma",
  designation: "Senior Software Engineer",
  company: "Infuse Consulting",
  hobbies: ["Reading", "Listening to music", "Collecting stamps"],
};

/**
 * Use destructuting to log the following
 */

const printUserProfile = () => {
  const { name, designation, company, hobbies } = user;
  const hobbiesString = hobbies.join(", ");
  console.log(
    `${name} is a ${designation} at ${company}. He likes ${hobbiesString}.`
  );
};

printUserProfile();
