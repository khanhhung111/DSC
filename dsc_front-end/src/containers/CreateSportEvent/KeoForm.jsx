import React from 'react';
import styles from './KeoForm.module.css';

const FormField = ({ icon, label, children }) => (
  <div className={styles.formField}>
    <label>
      {icon} {label}
    </label>
    {children}
  </div>
);

const RadioButton = ({ id, name, value, label, checked, onChange }) => (
  <div className={styles.radioGroup}>
<input
  type="radio"
  id={id}
  name={name}
  value={value}
  checked={checked}
  onChange={onChange}
  className={styles['visually-hidden']}
/>
    <label htmlFor={id} className={styles.radioLabel}>
      {label}
    </label>
    <span className={styles.radioButton}>{checked ? '🔘' : '⚪'}</span>
  </div>
);

function KeoForm() {
  return (
    <form className={styles.container}>
      <section className={styles.leftSection}>
        <h2 className={styles.formTitle}>KÈO</h2>
        <FormField icon="📅" label="Chọn ngày và giờ">
          <input type="datetime-local" aria-label="Chọn ngày và giờ" />
        </FormField>
        <FormField icon="⏱️" label="1 tiếng">
          <input type="text" value="1 tiếng" readOnly aria-label="Thời gian" />
        </FormField>
        <FormField icon="⛳️" label="Chọn địa điểm">
          <select aria-label="Chọn địa điểm">
            <option>Chọn địa điểm</option>
          </select>
        </FormField>
        <div className={styles.playerCount}>
          <label className={styles.playerCountLabel}>👤 Số người chơi</label>
          <input type="number" className={styles.playerCountInput} aria-label="Số người chơi" />
        </div>
        <div className={styles.costSection}>
          <label className={styles.costLabel}>💲 Chi phí</label>
          <span className={styles.freeTag}>🆓</span>
          <div className={styles.costInputGroup}>
            <input type="number" className={styles.costInput} aria-label="Chi phí mỗi người" />
            <span className={styles.costUnit}>/Người</span>
          </div>
          <div className={styles.costInputGroup}>
            <input type="number" className={styles.costInput} aria-label="Chi phí mỗi đội" />
            <span className={styles.costUnit}>/Đội</span>
          </div>
        </div>
        <div className={styles.skillLevelSection}>
          <label className={styles.skillLevelLabel}>Tối thiểu</label>
          <select className={styles.skillLevelSelect} aria-label="Trình đội tối thiểu">
            <option>Chọn trình độ</option>
          </select>
        </div>
        <div className={styles.skillLevelSection}>
          <label className={styles.skillLevelLabel}>Tối đa</label>
          <select className={styles.skillLevelSelect} aria-label="Trình đội tối thiểu">
            <option>Chọn trình độ</option>
          </select>
        </div>
      </section>
      <div className={styles.divider} role="separator"></div>
      <section className={styles.rightSection}>
        <label className={styles.keoNameLabel}>Tên kèo</label>
        <input
          type="text"
          className={styles.keoNameInput}
          placeholder="Vd: Giao hữu với tôi"
          aria-label="Tên kèo"
        />
        <textarea
          className={styles.descriptionInput}
          placeholder="Mô tả"
          aria-label="Mô tả"
        ></textarea>
        <div className={styles.autoApproveSection}>
          <label className={styles.autoApproveLabel}>Duyệt tự động</label>
          <RadioButton
            id="auto-approve-yes"
            name="auto-approve"
            value="yes"
            label="Có"
            checked={true}
            onChange={() => {}}
          />
          <RadioButton
            id="auto-approve-no"
            name="auto-approve"
            value="no"
            label="Không"
            checked={false}
            onChange={() => {}}
          />
        </div>
      </section>
    </form>
  );
}

export default KeoForm;