/*

=========================================================
* AppSeed - Simple SCSS compiler via Gulp
=========================================================

*/

var autoprefixer = require('gulp-autoprefixer');
var browserSync = require('browser-sync').create();
var cleanCss = require('gulp-clean-css');
var gulp = require('gulp');
const npmDist = require('gulp-npm-dist');
var sass = require('gulp-sass')(require('node-sass'));
var wait = require('gulp-wait');
var sourcemaps = require('gulp-sourcemaps');
var rename = require("gulp-rename");

// Define COMMON paths

const paths = {
    src: {
        base: './',
        css: './css',
        scss: './scss',
        node_modules: './node_modules/',
        vendor: './vendor'
    }
};

// Compile SCSS
gulp.task('scss', function() {
    return gulp.src([paths.src.scss + '/material-dashboard.scss'])
        .pipe(wait(500))
        .pipe(sourcemaps.init())
        .pipe(sass().on('error', sass.logError))
        .pipe(autoprefixer({
            overrideBrowserslist: ['> 1%']
        }))
        .pipe(sourcemaps.write('.'))
        .pipe(gulp.dest(paths.src.css))
        .pipe(browserSync.stream());
});

// Minify CSS
gulp.task('minify:css', function() {
    return gulp.src([
            paths.src.css + '/material-dashboard.css'
        ])
        .pipe(cleanCss())
        .pipe(rename(function(path) {
            // Updates the object in-place
            path.extname = ".min.css";
        }))
        .pipe(gulp.dest(paths.src.css))
});

// Watch SCSS and HTML files for changes
gulp.task('watch', function() {
    gulp.watch(paths.src.scss + '/**/*.scss', gulp.series('scss', 'minify:css'));  // SCSS dosyalarını izler ve değişiklik olduğunda derler
    gulp.watch('./**/*.html').on('change', browserSync.reload);  // HTML dosyalarını izler ve değişiklik olduğunda tarayıcıyı yeniler
});

// Serve task with BrowserSync
gulp.task('serve', gulp.series('scss', 'minify:css', function() {
    browserSync.init({
        server: paths.src.base
    });

    gulp.watch(paths.src.scss + '/**/*.scss', gulp.series('scss', 'minify:css'));
    gulp.watch('./**/*.html').on('change', browserSync.reload);
}));

// Default Task: Compile SCSS, minify the result, and watch for changes
gulp.task('default', gulp.series('scss', 'minify:css', 'watch'));
