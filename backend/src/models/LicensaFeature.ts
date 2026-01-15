import {
  Table,
  Column,
  Model,
  PrimaryKey,
  AutoIncrement,
  ForeignKey,
  Default,
  BelongsTo,
  CreatedAt,
  UpdatedAt
} from "sequelize-typescript";
import License from "./License";
import Feature from "./Feature";

@Table
class LicenseFeature extends Model<LicenseFeature> {
  @PrimaryKey
  @AutoIncrement
  @Column
  id: number;

  @ForeignKey(() => License)
  @Column
  licenseId: number;

  @ForeignKey(() => Feature)
  @Column
  featureId: number;

  @Default(true)
  @Column
  active: boolean;

  @BelongsTo(() => License)
  license: License;

  @BelongsTo(() => Feature)
  feature: Feature;

  @Column
  createdBy: string;

  @CreatedAt
  createdAt: Date;

  @Column
  updatedBy: string;

  @UpdatedAt
  updatedAt: Date;
}

export default LicenseFeature;
