package simulations

import io.gatling.core.Predef._
import io.gatling.http.Predef._
import scala.concurrent.duration._
import com.typesafe.config._



class HelpWithFeesPerformance extends Simulation
with HttpConfiguration
{
  val conf = ConfigFactory.load()
  val baseurl = "http://localhost:3000"
  val httpconf = httpProtocol.baseURL(baseurl).disableCaching

  val scenario1 = scenario("Happy Path")

    //////  Landing Page  //////

    .exec(http("/get-help-with-court-fees")
        .get("/get-help-with-court-fees")
        .check(status.is(200))
        .check(regex("Start now").exists))

    {
        exec(http("/start")
            .get("/start")
            .check(status.is(200))
            .check( currentLocation.is(baseurl + "/questions/form_name?locale=en") ))
    }

    //////  Step One  //////

    .exec(http("/questions/form_name?locale=en")
        .post("/questions/form_name?locale=en")
        .formParam("form_name[et]", "1")
        .formParam("commit", "Continue")
        .check(status.is(200))
        .check(currentLocation.is(baseurl + "/questions/marital_status?locale=en")))

    //////  Step Two  //////

    .exec(http("/questions/fee?locale=en")
        .post("/questions/fee?locale=en")
        .formParam("fee[paid]", "false")
        .formParam("commit", "Continue")
        .check(status.is(200))
        .check(currentLocation.is(baseurl + "/questions/marital_status?locale=en")))

    //////  Step Three  //////

    .exec(http("/questions/marital_status?locale=en")
        .post("/questions/marital_status?locale=en")
        .formParam("marital_status[married]", "false")
        .formParam("commit", "Continue")
        .check(status.is(200))
        .check(currentLocation.is(baseurl + "/questions/savings_and_investment?locale=en")))

    //////  Step Four  //////        

    .exec(http("/questions/savings_and_investment?locale=en")
        .post("/questions/savings_and_investment?locale=en")
        .formParam("savings_and_investment[choice]", "between")
		.formParam("commit", "Continue")
        .check(status.is(200))
        .check(currentLocation.is(baseurl + "/questions/savings_and_investment_extra?locale=en")))

    //////  Step Five  //////

    .exec(http("/questions/savings_and_investment_extra?locale=en")
        .post("/questions/savings_and_investment_extra?locale=en")
        .formParam("savings_and_investment_extra[over_61]", "false")
		.formParam("savings_and_investment_extra[amount]", "3000")
		.formParam("commit", "Continue")
        .check(status.is(200))
        .check(currentLocation.is(baseurl + "/questions/benefit?locale=en")))

    //////  Step Six  //////

    .exec(http("/questions/benefit?locale=en")
        .post("/questions/benefit?locale=en")
        .formParam("benefit[on_benefits]", "false")
		.formParam("commit", "Continue")
        .check(status.is(200))
        .check(currentLocation.is(baseurl + "/questions/dependent?locale=en")))

    //////  Step Seven  //////    

    .exec(http("/questions/dependent?locale=en")
        .post("/questions/dependent?locale=en")
        .formParam("dependent[children]", "false")
        .formParam("commit", "Continue")
        .check(status.is(200))
        .check(currentLocation.is(baseurl + "/questions/income_kind?locale=en")))

    //////  Step Eight  //////    

    .exec(http("/questions/income_kind?locale=en")
        .post("/questions/income_kind?locale=en")
        .formParam("income_kind[applicant][]", "1")
		.formParam("commit", "Continue")
        .check(status.is(200))
        .check(currentLocation.is(baseurl + "/questions/income_range?locale=en")))

    //////  Step Nine  //////

    .exec(http("/questions/income_range?locale=en")
        .post("/questions/income_range?locale=en")
        .formParam("income_range[choice]", "between")
		.formParam("commit", "Continue")
        .check(status.is(200))
        .check(currentLocation.is(baseurl + "/questions/income_amount?locale=en")))

    //////  Step Ten  //////

    .exec(http("/questions/income_amount?locale=en")
        .post("/questions/income_amount?locale=en")
        .formParam(" ")
        .formParam("commit", "Continue")
        .check(status.is(200))
        .check(currentLocation.is(baseurl + "/questions/probate?locale=en")))

    //////  Step Twelve  //////    

    .exec(http("/questions/probate?locale=en")
        .post("/questions/probate?locale=en")
        .formParam("claim/et[identifier]", "HFHEBCDHI")
		.formParam("commit", "Continue")
        .check(status.is(200))
        .check(currentLocation.is(baseurl + "/questions/national_insurance?locale=en")))

    //////  Step Thirteen  //////    

    .exec(http("/questions/national_insurance?locale=en")
        .post("/questions/national_insurance?locale=en")
        .formParam("national_insurance[number]", "JR043907D")
		.formParam("commit", "Continue")
        .check(status.is(200))
        .check(currentLocation.is(baseurl + "/questions/dob?locale=en")))

    //////  Step Fourteen  //////

    .exec(http("/questions/dob?locale=en")
        .post("/questions/dob?locale=en")
        .formParam("dob[date_of_birth]", "07/01/1955")
		.formParam("commit", "Continue")
        .check(status.is(200))
        .check(currentLocation.is(baseurl + "/questions/personal_detail?locale=en")))

    //////  Step Fifteen  //////    

    .exec(http("/questions/personal_detail?locale=en")
        .post("/questions/personal_detail?locale=en")
        .formParam("personal_detail[title]", "Ms")
		.formParam("personal_detail[first_name]", "Jenny")
		.formParam("personal_detail[last_name]", "Smith")
		.formParam("commit", "Continue")
        .check(status.is(200))
        .check(currentLocation.is(baseurl + "/questions/applicant_address?locale=en")))

    //////  Step Sixteen  ////// 

    .exec(http("/questions/applicant_address?locale=en")
        .post("/questions/applicant_address?locale=en")
        .formParam("applicant_address[address]", "14 Springfield Court Ilford")
        .formParam("applicant_address[postcode]", "IG1 2BN")
        .check(status.is(200))
        .check(currentLocation.is(baseurl + "/questions/contact?locale=en")))

    //////  Step Seventeen  //////

    .exec(http("/questions/contact?locale=en")
        .post("/questions/contact?locale=en")
        .formParam("commit", "Continue")
        .check(status.is(200))
        .check(currentLocation.is(baseurl + "/summary?locale=en")))

    //////  Step Eighteen  //////    

    .exec(http("/summary?locale=en")
        .post("/summary?locale=en")
        .formParam("commit", "Submit application and continue")
        .check(status.is(200))
        .check(currentLocation.is(baseurl + "/submission?locale=en")))
       
  val userCount = conf.getInt("users")
  val durationInSeconds  = conf.getLong("duration")

  setUp(
    scenario1.inject(rampUsers(userCount) over (durationInSeconds seconds)).protocols(httpconf)
  )

}
