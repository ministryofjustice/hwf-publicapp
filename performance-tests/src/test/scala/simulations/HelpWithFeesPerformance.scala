package simulations

import io.gatling.core.Predef._
import io.gatling.http.Predef._
import scala.concurrent.duration._
import com.typesafe.config._



class HelpWithFeesPerformance extends Simulation
with HttpConfiguration
{
  val conf = ConfigFactory.load()
  val baseurl = conf.getString("baseUrl")
  val httpconf = httpProtocol.baseURL(baseurl).disableCaching

  val scenario1 = scenario("Happy Path for Help with Fees")

    .exec(http("Start Session")
        .get("/session/start?locale=en"))

    //////  Step One  //////

    .exec(http("Store authenticity token")
        .get("/questions/form_name?locale=en")
        .check(css("input[name='authenticity_token']", "value").saveAs("csrfCookie")))

    .exec(http("Step One")
        .put("/questions/form_name?locale=en")
        .formParam("form_name[et]", "1")
        .formParam("authenticity_token", session => {
              session("csrfCookie").as[String]
            })
        .check(status.is(200)))


    //////  Step Two  //////

    .exec(http("Step Two")
        .put("/questions/fee?locale=en")
        .formParam("fee[paid]", "false")
        .formParam("authenticity_token", session => {
              session("csrfCookie").as[String]
            })
        .check(status.is(200)))

    //////  Step Three  //////

    .exec(http("Step Three")
        .put("/questions/marital_status?locale=en")
        .formParam("marital_status[married]", "false")
        .formParam("authenticity_token", session => {
              session("csrfCookie").as[String]
            })
        .check(status.is(200)))

    //////  Step Four  //////        

    .exec(http("Step Four")
        .put("/questions/savings_and_investment?locale=en")
        .formParam("authenticity_token", session => {
              session("csrfCookie").as[String]
            })
        .formParam("savings_and_investment[choice]", "between")
        .check(status.is(200)))

    //////  Step Five  //////

    .exec(http("Step Five")
        .put("/questions/savings_and_investment_extra?locale=en")
        .formParam("authenticity_token", session => {
              session("csrfCookie").as[String]
            })
        .formParam("savings_and_investment_extra[over_61]", "false")
		.formParam("savings_and_investment_extra[amount]", "3000")
        .check(status.is(200)))

    //////  Step Six  //////

    .exec(http("Step Six")
        .put("/questions/benefit?locale=en")
        .formParam("authenticity_token", session => {
              session("csrfCookie").as[String]
            })
        .formParam("benefit[on_benefits]", "false")
        .check(status.is(200)))

    //////  Step Seven  //////    

    .exec(http("Step Seven")
        .put("/questions/dependent?locale=en")
        .formParam("authenticity_token", session => {
              session("csrfCookie").as[String]
            })
        .formParam("dependent[children]", "false")
        .check(status.is(200)))

    //////  Step Eight  //////    

    .exec(http("Step Eight")
        .put("/questions/income_kind?locale=en")
        .formParam("authenticity_token", session => {
              session("csrfCookie").as[String]
            })
        .formParam("income_kind[applicant][]", "3")
        .check(status.is(200)))

    //////  Step Nine  //////

    .exec(http("Step Nine")
        .put("/questions/income_range?locale=en")
        .formParam("authenticity_token", session => {
              session("csrfCookie").as[String]
            })
        .formParam("income_range[choice]", "between")
        .check(status.is(200)))

    //////  Step Ten  //////

    .exec(http("Step Ten")
        .put("/questions/income_amount?locale=en")
        .formParam("authenticity_token", session => {
              session("csrfCookie").as[String]
            })
        .formParam("income_amount[amount]", "1000")
        .check(status.is(200)))

    //////  Step Twelve  //////    

    .exec(http("Step Twelve")
        .put("/questions/claim?locale=en")
        .formParam("authenticity_token", session => {
              session("csrfCookie").as[String]
            })
        .formParam("claim/et[identifier]", "HFHEBCDHI")
        .check(status.is(200)))

    //////  Step Thirteen  //////    

    .exec(http("Step Thirteen")
        .put("/questions/national_insurance?locale=en")
        .formParam("authenticity_token", session => {
              session("csrfCookie").as[String]
            })
        .formParam("national_insurance[number]", "JR043907D")
        .check(status.is(200)))

    //////  Step Fourteen  //////

    .exec(http("Step Fourteen")
        .put("/questions/dob?locale=en")
        .formParam("authenticity_token", session => {
              session("csrfCookie").as[String]
            })
        .formParam("dob[date_of_birth]", "07/01/1955")
        .check(status.is(200)))

    //////  Step Fifteen  //////    

    .exec(http("Step Fifteen")
        .put("/questions/personal_detail?locale=en")
        .formParam("authenticity_token", session => {
              session("csrfCookie").as[String]
            })
        .formParam("personal_detail[title]", "Ms")
		.formParam("personal_detail[first_name]", "Jenny")
		.formParam("personal_detail[last_name]", "Smith")
        .check(status.is(200)))

    //////  Step Sixteen  ////// 

    .exec(http("Step Sixteen")
        .put("/questions/applicant_address?locale=en")
        .formParam("authenticity_token", session => {
              session("csrfCookie").as[String]
            })
        .formParam("applicant_address[address]", "14 Springfield Court Ilford")
        .formParam("applicant_address[postcode]", "IG1 2BN")
        .check(status.is(200)))

    //////  Step Seventeen  //////

    .exec(http("Step Seventeen")
        .put("/questions/contact?locale=en")
        .formParam("authenticity_token", session => {
              session("csrfCookie").as[String]
            })
        .formParam("contact[email]", "johndoe@example.com")
        .check(status.is(200)))

    //////  Step Eighteen  //////    

    .exec(http("Step Eighteen")
        .get("/summary?locale=en")
        .check(status.is(200)))

  val userCount = conf.getInt("users")
  val durationInSeconds  = conf.getLong("duration")

  setUp(
    scenario1.inject(rampUsers(userCount) over (durationInSeconds seconds)).protocols(httpconf)
  )

}
