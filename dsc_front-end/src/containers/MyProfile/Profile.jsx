import React from 'react';
import HeaderLogin from '../../components/Header/HearderLogin';
import Sidebar from './Sidebar'
import AccountDetails from './AccountDetails'
import Footer from '../../components/Footer/Footer';
import styles from './Profile.module.css';

function Profile() {
  return (
    <div className={styles.accountProfile}>
      <HeaderLogin />
      <main className={styles.mainContent}>
        <Sidebar />
        <AccountDetails />
      </main>
      <Footer />
    </div>
  );
}

export default Profile;