import "./App.css";
import { BrowserRouter, Routes, Route } from "react-router-dom";

// import  from "./components/Layout";
import Home from "./containers/Home/Homepage";
import HomePageLogin from "./containers/Home/HomepageLogin";
import Login from "./containers/Login/Login";
import SignUp from "./containers/SignUp/SignUp";
import ResetPassword from "./containers/ResetPassword";
import UserAbout from "./containers/UserAbout/UserAbout";
import { ProtectRoutes } from "./hooks/ProtectRoutes";
import AppProvider from "./hooks";
// import MyCalendar from "./components/MyCalendar";
import MyProfile from "./containers/MyProfile/Profile";
// import Admin from "./containers/Admin";
import Header from "./components/Header/Hearder";
import SportsBetting from "./containers/SportsBetting/SportsBetting";
import ManagementSportsBetting from "./containers/ManagementSportsBetting/SportsBetting";
import MyBetting from "./containers/MyBetting/SportsBetting"
import Club from "./containers/Club/ClubPage"
import DetailClub from "./containers/DetailClub/Match";
import SportClubCreation from "./containers/Createclub/SportClubCreation"
import AccountPage from "./containers/AccountPage/AccountPage";
import AccountSport from "./containers/AccountPage/AccountSport";
import AddSportAcc from "./containers/AccountPage/AddSportAcc";
import MemberMatch from "./containers/MemberMatch/MemberMatch";
import Match from "./containers/DetailMatch/Match";
import MyClub from "./containers/MyClub/ClubPage";
import DetailMyClub from "./containers/DetailMyClub/Match";
import DetailMyBetting from "./containers/DetailMyBetting/Match";
import DetailJoined from "./containers/DetailJoined/Match"
import MemberMyMatch from "./containers/MemberMyMatch/MemberMatch";
import MemberMyClub from "./containers/MemberMyClub/MemberClub";
import JoinActivity from "./containers/JoinActivity/MemberMatch";
import CreateSportEvent from "./containers/CreateSportEvent/CreateSportEvent";
import ResultMatch from "./containers/ResultMatch/ResultMatch";
import Security from "./containers/Security/Security";
import UpdateSportEvent from "./containers/UpdateSportEvent/UpdateSportEvent";
function App() {
  return (
    <BrowserRouter>
      <AppProvider>
        <Routes>
          <Route index element={<Home />} />
          <Route path="/login" element={<Login />} />
          <Route path="/signup" element={<SignUp />} />
          <Route path="/reset-password" element={<ResetPassword />} />
          <Route path="/my-profile" element={<MyProfile />} />
          <Route path="/sportbetting" element={<SportsBetting />} />
          <Route path="/management-betting" element={<ManagementSportsBetting />} />
          <Route path="/mybetting" element={<MyBetting />} />
          <Route path="club" element={<Club />} />
          <Route path="detailclub/:clubId" element={<DetailClub />} />
          <Route path="myclub" element={<MyClub />} />
          <Route path="myclubdetail/:clubId" element={<DetailMyClub />} />
          <Route path="/membermyclub/:clubId" element={<MemberMyClub />} />
          <Route path="/home" element={<HomePageLogin />} />
          <Route path="/createclub" element={<SportClubCreation />} />
          <Route path="/account" element={<AccountPage />} />
          <Route path="/accountsports" element={<AccountSport />} />
          <Route path="/addsportsacc" element={<AddSportAcc />} />
          <Route path="/membermatch/:activityId" element={<MemberMatch />} />
          <Route path="/membermymatch/:activityId" element={<MemberMyMatch />} />
          <Route path="/approvemember/:activityId" element={<JoinActivity />} />
          <Route path="/detailmatch/:activityId" element={<Match />} />
          <Route path="/detailmymatch/:activityId" element={<DetailMyBetting />} />
          <Route path="/detailmatchjoined/:activityId" element={<DetailJoined />} />
          <Route path="/createsportevent" element={<CreateSportEvent />} />
          <Route path="/updatesportevent/:activityId" element={<UpdateSportEvent />} />
          <Route path="/resultmatch" element={<ResultMatch />} />
          <Route path="/security" element={<Security />} />
          <Route element={<ProtectRoutes />}>
            <Route path="user-about" element={<UserAbout />} />
            
            {/* <Route
              path="user-my-calendar"
              element={(<MyCalendar />)}
            /> */}
            {/* <Route
              path="event-detail"
              element={(<EventDetail />)}
            />
            <Route
              path="user-my-calendar/new-booking"
              element={(<NewBooking />)}
            /> */}
            {/* <Route path="news/:id" element={(<News />)} /> */}
            {/* <Route
              path="user-my-calendar/new-booking/payment/:companyNameForPayment"
              element={(<Payment />)}
            /> */}
            
            {/* <Route
              path="change-pass"
              element={(<ChangePass />)}
            />
            <Route
              path="booking-detail/:bookingName"
              element={(<BookingDetail />)}
            />
            <Route
              path="customer-unpaid-list"
              element={(<CustomerUnpaidList />)}
            />
            <Route path="admin" element={<Admin />} />
            <Route path="contract/:bookingName" element={<Contract />} /> */}
          </Route>
        </Routes>
      </AppProvider>
    </BrowserRouter>
  );
}

export default App;
