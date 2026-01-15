import { AllowNull, AutoIncrement, BelongsTo, Column, CreatedAt, Default, ForeignKey, Model, PrimaryKey, Table, UpdatedAt } from "sequelize-typescript";
import Feature from "./Feature";
import License from "./License";

@Table
class LicenseLimit extends Model<LicenseLimit> {
    @PrimaryKey
    @AutoIncrement
    @Column
    id: number;

    @ForeignKey(() => License)
    @AllowNull(false)
    @Column
    licenseId: number;

    @Column
    resource: string; // users, whatsapps, queues

    @Column
    limit: number;

    @BelongsTo(() => License)
    license: License;

    @AllowNull(false)
    @Column
    createdBy: string;

    @AllowNull(false)
    @CreatedAt
    createdAt: Date;

    @Column
    updatedBy: string;

    @UpdatedAt
    updatedAt: Date;
}
export default LicenseLimit;