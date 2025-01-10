using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hospital_management.Doctor
{
    public partial class NutritionWellness : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack) {
                fnBindHealthGoals();
            }
        }

        protected void fnBindHealthGoals()
        {
            ddlHealthGoals.Items.Clear();
            ddlHealthGoals.Items.Add("Weight Management");
            ddlHealthGoals.Items.Add("Fitness Improvement");
            ddlHealthGoals.Items.Add("Chronic Disease Management");
            ddlHealthGoals.Items.Add("Mental Health and Well-being");
            ddlHealthGoals.Items.Add("Nutritional Goals");
            ddlHealthGoals.Items.Add("Lifestyle Changes");
            ddlHealthGoals.Items.Add("Rehabilitation and Recovery");
            ddlHealthGoals.Items.Add("Disease Prevention");
            ddlHealthGoals.Items.Add("Specialized Goals");
            ddlHealthGoals.Items.Insert(0, new ListItem("select"));
        }

        protected void fnBindHealthGoalTypes()
        {
            try
            {
                ddlHealthGoalsTypes.Items.Clear();
                if(ddlHealthGoals.SelectedValue == "Weight Management")
                {
                    ddlHealthGoalsTypes.Items.Add("Lose Weight");
                    ddlHealthGoalsTypes.Items.Add("Gain Weight");
                    ddlHealthGoalsTypes.Items.Add("Maintain Current Weight");
                }
                else if(ddlHealthGoals.SelectedValue == "Fitness Improvement")
                {
                    ddlHealthGoalsTypes.Items.Add("Increase Endurance");
                    ddlHealthGoalsTypes.Items.Add("Build Muscle Mass");
                    ddlHealthGoalsTypes.Items.Add("Improve Flexibility");
                    ddlHealthGoalsTypes.Items.Add("Enhance Strength");
                }
                else if(ddlHealthGoals.SelectedValue == "Chronic Disease Management")
                {
                    ddlHealthGoalsTypes.Items.Add("Manage Diabetes");
                    ddlHealthGoalsTypes.Items.Add("Lower Cholesterol Levels");
                    ddlHealthGoalsTypes.Items.Add("Control Blood Pressure");
                    ddlHealthGoalsTypes.Items.Add("Improve Asthma Control");
                    ddlHealthGoalsTypes.Items.Add("Manage Arthritis Symptoms");
                }
                else if(ddlHealthGoals.SelectedValue == "Mental Health and Well-being")
                {
                    ddlHealthGoalsTypes.Items.Add("Reduce Stress");
                    ddlHealthGoalsTypes.Items.Add("Improve Sleep Quality");
                    ddlHealthGoalsTypes.Items.Add("Practice Mindfulness");
                    ddlHealthGoalsTypes.Items.Add("Manage Anxiety or Depression");
                }
                else if(ddlHealthGoals.SelectedValue == "Nutritional Goals")
                {
                    ddlHealthGoalsTypes.Items.Add("Increase Protein Intake");
                    ddlHealthGoalsTypes.Items.Add("Reduce Sugar Consumption");
                    ddlHealthGoalsTypes.Items.Add("Follow a Specific Diet");
                    ddlHealthGoalsTypes.Items.Add("Avoid Processed Foods");
                    ddlHealthGoalsTypes.Items.Add("Meet Daily Water Intake");
                }
                else if(ddlHealthGoals.SelectedValue == "Lifestyle Changes")
                {
                    ddlHealthGoalsTypes.Items.Add("Quit Smoking");
                    ddlHealthGoalsTypes.Items.Add("Reduce Alcohol Consumption");
                    ddlHealthGoalsTypes.Items.Add("Adopt an Exercise Routine");
                    ddlHealthGoalsTypes.Items.Add("Spend More Time Outdoors");
                }
                else if(ddlHealthGoals.SelectedValue == "Rehabilitation and Recovery")
                {
                    ddlHealthGoalsTypes.Items.Add("Regain Mobility After Surgery");
                    ddlHealthGoalsTypes.Items.Add("Recover from Injury");
                    ddlHealthGoalsTypes.Items.Add("Rebuild Stamina Post-Illness");
                }
                else if(ddlHealthGoals.SelectedValue == "Disease Prevention")
                {
                    ddlHealthGoalsTypes.Items.Add("Prevent Diabetes");
                    ddlHealthGoalsTypes.Items.Add("Maintain Heart Health");
                    ddlHealthGoalsTypes.Items.Add("Strengthen Bones");
                    ddlHealthGoalsTypes.Items.Add("Balance Hormones");
                }
                else if(ddlHealthGoals.SelectedValue == "Specialized Goals")
                {
                    ddlHealthGoalsTypes.Items.Add("Prepare for Pregnancy");
                    ddlHealthGoalsTypes.Items.Add("Manage Postpartum Recovery");
                    ddlHealthGoalsTypes.Items.Add("Monitor High-Risk Conditions");
                    ddlHealthGoalsTypes.Items.Add("Manage Rare Diseases");
                }

                ddlHealthGoalsTypes.Items.Insert(0, new ListItem("select"));
            }
            catch(Exception HealthGoalSelectionError)
            {
                Response.Write(HealthGoalSelectionError.ToString());
                throw;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string patientName = txtPatientName.Text;
                string doctorName = txtDoctorName.Text;
                string dietPlan = txtDietPlan.Text;
                string exerciseplan = txtExercisePlan.Text;
                string healthGoal = ddlHealthGoals.SelectedValue;
                string healthGoalType = ddlHealthGoalsTypes.SelectedValue;
                string allergies = txtAllergies.Text;
                string createDate = txtCreatedDate.Text;
                string lastUpdates = txtLastUpdated.Text;
                string planStatus = ddlPlanStatus.SelectedValue;
                string notes = txtNotes.Text;

                lblDetails.Text = "</br>patientName : " + patientName +
                    "</br>doctorName :  " + doctorName +
                    "</br>dietPlan : " + dietPlan +
                    "</br>exerciseplan : " + exerciseplan +
                    "</br>healthGoal : " + healthGoal +
                    "</br>healthGoalType : " + healthGoalType +
                    "</br>allergies : " + allergies +
                    "</br>createDate : " + createDate +
                    "</br>lastUpdates : " + lastUpdates +
                    "</br>planStatus : " + planStatus +
                    "</br>notes : " +notes;

    }
            catch(Exception saveError)
            {
                Response.Write(saveError.ToString());
                throw;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtPatientName.Text = "";
            txtDoctorName.Text = "";
            txtDietPlan.Text = "";
            txtExercisePlan.Text = "";
            ddlHealthGoals.ClearSelection(); 
            ddlHealthGoalsTypes.ClearSelection();
            txtAllergies.Text= "";
            txtCreatedDate.Text= "";
            txtLastUpdated.Text= "";
            ddlPlanStatus.ClearSelection();
            txtNotes.Text= "";
            lblDetails.Text="";
        }

        protected void ddlHealthGoals_SelectedIndexChanged(object sender, EventArgs e)
        {
            fnBindHealthGoalTypes();
        }

        
    }
}