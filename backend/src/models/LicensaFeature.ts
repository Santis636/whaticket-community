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
  UpdatedAt,
  AllowNull
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
  @AllowNull(false)
  @Column
  licenseId: number;

  @ForeignKey(() => Feature)
  @AllowNull(false)
  @Column
  featureId: number;

  @Default(true)
  @Column
  active: boolean;

  @BelongsTo(() => License)
  license: License;

  @BelongsTo(() => Feature)
  feature: Feature;

  @AllowNull(false)
  @Column
  createdBy: string;

  @CreatedAt
  createdAt: Date;
  
  @AllowNull(false)
  @Column
  updatedBy: string;

  @UpdatedAt
  updatedAt: Date;
}

export default LicenseFeature;
