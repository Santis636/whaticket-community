import {
  Table,
  Column,
  CreatedAt,
  UpdatedAt,
  Model,
  PrimaryKey,
  AutoIncrement,
  AllowNull,
  Unique,
  Default,
  HasMany,
  ForeignKey,
  BelongsTo
} from "sequelize-typescript";
import ContactCustomField from "./ContactCustomField";
import Ticket from "./Ticket";
import Company from "./Company"

@Table({
  indexes: [
    {
      unique: true,
      fields: ["companyId", "number"]
    }
  ]
})
class Contact extends Model<Contact> {
  @PrimaryKey
  @AutoIncrement
  @Column
  id: number;

  @Column
  name: string;

  @AllowNull(false)
  @Column
  number: string;

  @ForeignKey(() => Company)
  @AllowNull(false)
  @Column
  companyId: number;

  @BelongsTo(() => Company)
  company: Company;

  @AllowNull(false)
  @Default("")
  @Column
  email: string;

  @Column
  address: string;

  @Column
  document: string;

  @Column
  zipCode: string

  @Column
  addressComplement: string;

  @Column
  profilePicUrl: string;

  @Default(false)
  @Column
  isGroup: boolean;


  @CreatedAt
  createdAt: Date;

  @AllowNull(false)
  @Column
  createdBy: string;

  @UpdatedAt
  updatedAt: Date;

  @AllowNull(false)
  @Column
  updateBy: string;

  @HasMany(() => Ticket)
  tickets: Ticket[];

  @HasMany(() => ContactCustomField)
  extraInfo: ContactCustomField[];
}


export default Contact;
