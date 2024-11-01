/**
 * This code was generated by Builder.io.
 */
import React from "react";
import HeaderLogin from "../../components/Header/Hearder";
import ClubForm from "./ClubForm";
import SportSelection from "./SportSelection";
import SkillLevelSelection from "./SkillLevelSelection";
import styles from "./SportClubCreation.module.css";
import HeroSection from "../Club/HeroSection";

function SportClubCreation() {
  return (
    <div className={styles.sportClubCreation}>
      <HeaderLogin />
      <main className={styles.mainContent}>
        <section className={styles.clubCreationSection}>
          <HeroSection />
          <ClubForm />
          <SportSelection />
          <SkillLevelSelection />
          <button className={styles.createButton}>Tạo</button>
        </section>
      </main>
    </div>
  );
}

export default SportClubCreation;
