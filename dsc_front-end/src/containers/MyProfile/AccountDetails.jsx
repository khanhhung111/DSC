import React from 'react';
import styles from './AccountDetails.module.css';

const AccountField = ({ label, value, onEdit }) => (
  <div className={styles.accountField}>
    <div className={styles.fieldContent}>
      <h3 className={styles.fieldLabel}>{label}</h3>
      <p className={styles.fieldValue}>{value}</p>
    </div>
    <button onClick={onEdit} className={styles.editButton}>Chỉnh sửa</button>
  </div>
);

const AccountDetails = () => {
  const fields = [
    { label: 'Tên', value: 'Hung' },
    { label: 'Địa chỉ', value: 'N/A' },
    { label: 'Giới tính', value: 'N/A' },
    { label: 'Tuổi', value: 'N/A' },
    { label: 'Chiều cao', value: '178 cm' },
    { label: 'Cân nặng', value: '70 kg' },
  ];

  return (
    <section className={styles.accountDetails}>
      <h2 className={styles.sectionTitle}>Tài khoản</h2>
      <div className={styles.fieldsContainer}>
        {fields.map((field, index) => (
          <AccountField
            key={index}
            label={field.label}
            value={field.value}
            onEdit={() => console.log(`Edit ${field.label}`)}
          />
        ))}
      </div>
    </section>
  );
};

export default AccountDetails;