
import React from "react";
import HeroSection from "./HeroSection";
import ClubList from "./ClubList";
import SearchBar from "./SearchBar";
import styles from "./ClubPage.module.css";
import HeaderLogin from "../../components/Header/HearderLogin";
import Footer from "../../components/Footer/Footer";

function ClubPage() {
  return (
    <div>
      <HeaderLogin />
      <main className={styles.clubPage}>
        <HeroSection />
        <section className={styles.clubListSection}>
          <ClubList />
          <SearchBar />
        </section>
      </main>
      <Footer />
    </div>


  );
}

export default ClubPage;
